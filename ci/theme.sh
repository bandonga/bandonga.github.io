#!/usr/bin/env bash
set -euo pipefail

theme="${1:-catppuccin_mocha}"

case "$theme" in
  catppuccin_mocha | mocha)
    theme="catppuccin_mocha"
    ;;
  *)
    echo "Unsupported theme: $theme" >&2
    echo "Supported themes: catppuccin_mocha" >&2
    exit 1
    ;;
esac

cd "$(dirname "${BASH_SOURCE[0]}")/.."

ruby - "$theme" <<'RUBY'
theme = ARGV.fetch(0)
skin_path = "_sass/minimal-mistakes/skins/_#{theme}.scss"
abort "Missing theme skin: #{skin_path}" unless File.file?(skin_path)

skin = File.read(skin_path)

palette = skin.scan(/"([a-z0-9]+)"\s*:\s*(#[0-9a-fA-F]{6})/).to_h do |name, hex|
  [name.to_sym, hex.downcase]
end

required = %i[
  rosewater flamingo pink mauve red maroon peach yellow green teal sky sapphire
  blue lavender text subtext1 subtext0 overlay2 overlay1 overlay0 surface2
  surface1 surface0 base mantle crust
]
missing = required.reject { |name| palette.key?(name) }
abort "Theme #{skin_path} is missing palette colors: #{missing.join(', ')}" unless missing.empty?

def resolve_theme_color(skin, palette, variable)
  direct = skin[/\$#{Regexp.escape(variable)}:\s*(#[0-9a-fA-F]{6})/, 1]
  return direct.downcase if direct

  from_palette = skin[/\$#{Regexp.escape(variable)}:\s*map-get\(map-get\(\$palette,\s*"mocha"\),\s*"([^"]+)"\)/, 1]
  return palette.fetch(from_palette.to_sym) if from_palette

  nil
end

primary = resolve_theme_color(skin, palette, "primary-color") || palette.fetch(:lavender)
background = resolve_theme_color(skin, palette, "background-color") || palette.fetch(:base)
academy_background = palette.fetch(:mantle)

semantic_named_colors = {
  "black" => palette.fetch(:crust),
  "white" => palette.fetch(:text),
  "red" => palette.fetch(:red),
  "green" => palette.fetch(:green),
  "blue" => palette.fetch(:blue),
  "yellow" => palette.fetch(:yellow),
  "orange" => primary,
  "purple" => palette.fetch(:mauve),
  "gray" => palette.fetch(:overlay1),
  "grey" => palette.fetch(:overlay1)
}

fixed_hex = {
  "000" => palette.fetch(:crust),
  "000000" => palette.fetch(:crust),
  "fff" => palette.fetch(:text),
  "ffffff" => palette.fetch(:text),
  "1b2631" => background,
  "e5e9f1" => palette.fetch(:text),
  "e7f5ff" => background,
  palette.fetch(:peach).delete_prefix("#") => primary
}.transform_keys { |value| "##{value}" }

target_exts = %w[
  .css .scss .html .md .yml .yaml .json .webmanifest .svg .puml .excalidraw
]

def hex_to_rgb(hex)
  value = hex.delete_prefix("#")
  value = value.chars.map { |c| c * 2 }.join if value.length == 3 || value.length == 4
  return nil unless value.length == 6 || value.length == 8

  [
    value[0, 2].to_i(16),
    value[2, 2].to_i(16),
    value[4, 2].to_i(16),
    value.length == 8 ? value[6, 2].to_i(16) : nil
  ]
end

def rgb_distance(a, b)
  ((a[0] - b[0])**2) + ((a[1] - b[1])**2) + ((a[2] - b[2])**2)
end

palette_rgb = palette.transform_values { |hex| hex_to_rgb(hex) }
palette_values = palette.values

nearest_palette = lambda do |hex|
  normalized = hex.downcase
  return fixed_hex[normalized] if fixed_hex.key?(normalized)
  return normalized if palette_values.include?(normalized)

  rgb = hex_to_rgb(normalized)
  return normalized unless rgb

  alpha = rgb[3]
  winner = palette_rgb.min_by { |_name, candidate| rgb_distance(rgb, candidate) }.last
  winner_hex = format("#%02x%02x%02x", winner[0], winner[1], winner[2])
  alpha ? "#{winner_hex}#{format('%02x', alpha)}" : winner_hex
end

nearest_rgb = lambda do |body, fn_name|
  parts = body.split(",").map(&:strip)
  return "#{fn_name}(#{body})" unless parts.length >= 3

  rgb = parts[0, 3].map do |part|
    next nil unless part.match?(/\A\d+(?:\.\d+)?\z/)
    part.to_f.round.clamp(0, 255)
  end
  return "#{fn_name}(#{body})" if rgb.any?(&:nil?)

  winner = palette_rgb.min_by { |_name, candidate| rgb_distance(rgb, candidate) }.last
  suffix = parts[3..]&.join(", ")
  values = [winner[0], winner[1], winner[2]]
  values << suffix if suffix && !suffix.empty?
  "#{fn_name}(#{values.join(', ')})"
end

tracked_files = `git ls-files -z`.split("\0")

tracked_files.each do |path|
  next if path == skin_path
  next unless path == "_config.yml" || target_exts.include?(File.extname(path))
  next unless File.file?(path)

  original = File.read(path)
  text = original.dup

  if path == "_config.yml"
    text = text.gsub(
      /^minimal_mistakes_skin\s*:.*$/,
      'minimal_mistakes_skin    : "catppuccin_mocha" # "default", "air", "aqua", "catppuccin_latte", "catppuccin_mocha", "contrast", "dark", "dirt", "neon", "mint", "plum", "sunrise"'
    )
  end

  if path == "_includes/head/custom.html"
    text = text.gsub(/(<link rel="mask-icon"[^>]*\bcolor=")#[0-9a-fA-F]{3,8}(")/, "\\1#{primary}\\2")
    text = text.gsub(/(<meta name="msapplication-TileColor" content=")#[0-9a-fA-F]{3,8}(")/, "\\1#{background}\\2")
    text = text.gsub(/(<meta name="theme-color" content=")#[0-9a-fA-F]{3,8}(")/, "\\1#{background}\\2")
  end

  if path == "assets/images/site.webmanifest"
    text = text.gsub(/("theme_color"\s*:\s*")#[0-9a-fA-F]{3,8}(")/, "\\1#{background}\\2")
    text = text.gsub(/("background_color"\s*:\s*")#[0-9a-fA-F]{3,8}(")/, "\\1#{background}\\2")
  end

  if path.start_with?("assets/images/academy/") && File.extname(path) == ".svg"
    text = text.gsub(/fill:#{Regexp.escape(palette.fetch(:surface0))}\b/i, "fill:#{academy_background}")
    text = text.gsub(/fill="#{Regexp.escape(palette.fetch(:surface0))}"/i, %(fill="#{academy_background}"))
  end

  if File.extname(path) == ".svg"
    text = text.gsub(/pagecolor="#[0-9a-fA-F]{3,8}"/, %(pagecolor="#{background}"))
  end

  text = text.gsub(/#[0-9A-Fa-f]{3,8}\b/) { |match| nearest_palette.call(match) }

  text = text.gsub(/\b(rgba?|hsla?)\(([^)]*)\)/i) do |match|
    fn_name = Regexp.last_match(1)
    body = Regexp.last_match(2)
    if fn_name.downcase.start_with?("rgb")
      nearest_rgb.call(body, fn_name)
    else
      match
    end
  end

  text = text.gsub(/#(black|white|red|green|blue|yellow|orange|purple|grey|gray)\b/i) do
    semantic_named_colors.fetch(Regexp.last_match(1).downcase)
  end

  text = text.gsub(/\b(fill|stroke|background(?:-color)?|bordercolor|pagecolor|color)=(["'])(black|white|red|green|blue|yellow|orange|purple|grey|gray)\2/i) do
    attr = Regexp.last_match(1)
    quote = Regexp.last_match(2)
    color = semantic_named_colors.fetch(Regexp.last_match(3).downcase)
    "#{attr}=#{quote}#{color}#{quote}"
  end

  text = text.gsub(/(:\s*)(black|white|red|green|blue|yellow|orange|purple|grey|gray)(\s*[;,}])/i) do
    "#{Regexp.last_match(1)}#{semantic_named_colors.fetch(Regexp.last_match(2).downcase)}#{Regexp.last_match(3)}"
  end

  File.write(path, text) if text != original
end
RUBY
