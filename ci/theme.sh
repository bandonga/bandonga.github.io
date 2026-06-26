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

palette = {
  rosewater: '#f5e0dc',
  flamingo: '#f2cdcd',
  pink: '#f5c2e7',
  mauve: '#cba6f7',
  red: '#f38ba8',
  maroon: '#eba0ac',
  peach: '#fab387',
  yellow: '#f9e2af',
  green: '#a6e3a1',
  teal: '#94e2d5',
  sky: '#89dceb',
  sapphire: '#74c7ec',
  blue: '#89b4fa',
  lavender: '#b4befe',
  text: '#cdd6f4',
  subtext1: '#bac2de',
  subtext0: '#a6adc8',
  overlay2: '#9399b2',
  overlay1: '#7f849c',
  overlay0: '#6c7086',
  surface2: '#585b70',
  surface1: '#45475a',
  surface0: '#313244',
  base: '#1e1e2e',
  mantle: '#181825',
  crust: '#11111b'
}

semantic_named_colors = {
  'black' => palette[:crust],
  'white' => palette[:text],
  'red' => palette[:red],
  'green' => palette[:green],
  'blue' => palette[:blue],
  'yellow' => palette[:yellow],
  'orange' => palette[:peach],
  'purple' => palette[:mauve],
  'gray' => palette[:overlay1],
  'grey' => palette[:overlay1]
}

hex = ->(value) { "##{value}" }
fixed_hex = {
  hex.call('000') => palette[:crust],
  hex.call('000000') => palette[:crust],
  hex.call('fff') => palette[:text],
  hex.call('ffffff') => palette[:text],
  hex.call('1b2631') => palette[:base],
  hex.call('e5e9f1') => palette[:text],
  hex.call('e7f5ff') => palette[:base]
}

target_exts = %w[
  .css .scss .html .md .yml .yaml .json .webmanifest .svg .puml .excalidraw
]

def hex_to_rgb(hex)
  value = hex.delete_prefix('#')
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
  winner_hex = format('#%02x%02x%02x', winner[0], winner[1], winner[2])
  alpha ? "#{winner_hex}#{format('%02x', alpha)}" : winner_hex
end

nearest_rgb = lambda do |body, fn_name|
  parts = body.split(',').map(&:strip)
  return "#{fn_name}(#{body})" unless parts.length >= 3

  rgb = parts[0, 3].map do |part|
    next nil unless part.match?(/\A\d+(?:\.\d+)?\z/)
    part.to_f.round.clamp(0, 255)
  end
  return "#{fn_name}(#{body})" if rgb.any?(&:nil?)

  winner = palette_rgb.min_by { |_name, candidate| rgb_distance(rgb, candidate) }.last
  suffix = parts[3..]&.join(', ')
  values = [winner[0], winner[1], winner[2]]
  values << suffix if suffix && !suffix.empty?
  "#{fn_name}(#{values.join(', ')})"
end

tracked_files = `git ls-files -z`.split("\0")

tracked_files.each do |path|
  next unless path == '_config.yml' || target_exts.include?(File.extname(path))
  next unless File.file?(path)

  original = File.read(path)
  text = original.dup

  if path == '_config.yml'
    text = text.gsub(
      /^minimal_mistakes_skin\s*:.*$/,
      'minimal_mistakes_skin    : "catppuccin_mocha" # "default", "air", "aqua", "catppuccin_latte", "catppuccin_mocha", "contrast", "dark", "dirt", "neon", "mint", "plum", "sunrise"'
    )
  end

  text = text.gsub(/#[0-9A-Fa-f]{3,8}\b/) { |match| nearest_palette.call(match) }

  text = text.gsub(/\b(rgba?|hsla?)\(([^)]*)\)/i) do |match|
    fn_name = Regexp.last_match(1)
    body = Regexp.last_match(2)
    if fn_name.downcase.start_with?('rgb')
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
