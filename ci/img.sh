#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

renderer=""
if command -v inkscape >/dev/null 2>&1; then
  renderer="inkscape"
elif command -v rsvg-convert >/dev/null 2>&1; then
  renderer="rsvg-convert"
elif command -v magick >/dev/null 2>&1; then
  renderer="magick"
elif command -v qlmanage >/dev/null 2>&1; then
  renderer="qlmanage"
else
  cat >&2 <<'EOF'
No SVG renderer found.

Install one of:
  - inkscape
  - librsvg, providing rsvg-convert
  - imagemagick, providing magick
  - macOS Quick Look, providing qlmanage
EOF
  exit 1
fi

render_png() {
  local src="$1"
  local dst="$2"
  local width="$3"
  local height="$4"

  mkdir -p "$(dirname "$dst")"

  case "$renderer" in
    inkscape)
      inkscape "$src" \
        --export-type=png \
        --export-filename="$dst" \
        --export-width="$width" \
        --export-height="$height"
      ;;
    rsvg-convert)
      rsvg-convert "$src" \
        --width="$width" \
        --height="$height" \
        --output="$dst"
      ;;
    magick)
      magick -background none "$src" -resize "${width}x${height}!" "$dst"
      ;;
    qlmanage)
      local tmpdir
      local rendered
      tmpdir="$(mktemp -d)"
      qlmanage -t -s "$width" -o "$tmpdir" "$src" >/dev/null
      rendered="$tmpdir/$(basename "$src").png"
      if [[ ! -s "$rendered" ]]; then
        echo "Quick Look did not render $src" >&2
        rm -rf "$tmpdir"
        exit 1
      fi
      if [[ "$width" == "$height" ]]; then
        mv "$rendered" "$dst"
      elif command -v sips >/dev/null 2>&1; then
        sips -c "$height" "$width" "$rendered" --out "$dst" >/dev/null
      else
        echo "Cannot crop Quick Look output for $dst; install sips or a full SVG renderer." >&2
        rm -rf "$tmpdir"
        exit 1
      fi
      rm -rf "$tmpdir"
      ;;
  esac
}

render_ico() {
  local src="$1"
  local dst="$2"

  if command -v magick >/dev/null 2>&1; then
    magick -background none "$src" \
      -define icon:auto-resize=16,32,48 \
      "$dst"
    return
  fi

  local tmpdir
  tmpdir="$(mktemp -d)"
  render_png "$src" "$tmpdir/favicon-16.png" 16 16
  render_png "$src" "$tmpdir/favicon-32.png" 32 32
  render_png "$src" "$tmpdir/favicon-48.png" 48 48

  ruby - "$dst" "$tmpdir/favicon-16.png" "$tmpdir/favicon-32.png" "$tmpdir/favicon-48.png" <<'RUBY'
dst = ARGV.shift
pngs = ARGV.map do |path|
  size = File.basename(path)[/(\d+)/, 1].to_i
  [size, File.binread(path)]
end

offset = 6 + (pngs.length * 16)
entries = pngs.map do |size, data|
  width = size == 256 ? 0 : size
  entry = [width, width, 0, 0, 1, 32, data.bytesize, offset].pack("CCCCvvVV")
  offset += data.bytesize
  entry
end

File.binwrite(dst, [0, 1, pngs.length].pack("vvv") + entries.join + pngs.map(&:last).join)
RUBY
  rm -rf "$tmpdir"
}

render_safari_mask() {
  local src="$1"
  local dst="$2"

  ruby - "$src" "$dst" <<'RUBY'
src, dst = ARGV
skin = File.read("_sass/minimal-mistakes/skins/_bandonga_mocha.scss")
palette = skin.scan(/"([a-z0-9]+)"\s*:\s*(#[0-9a-fA-F]{6})/).to_h do |name, hex|
  [name, hex.downcase]
end
primary_name = skin[/\$primary-color:\s*map-get\(map-get\(\$palette,\s*"mocha"\),\s*"([^"]+)"\)/, 1] || "lavender"
background_name = skin[/\$background-color:\s*map-get\(map-get\(\$palette,\s*"mocha"\),\s*"([^"]+)"\)/, 1] || "base"

svg = File.read(src)
svg = svg.gsub(/pagecolor="#[0-9a-fA-F]{3,8}"/, %(pagecolor="#{palette.fetch("text")}"))
svg = svg.gsub(palette.fetch(primary_name), palette.fetch("crust"))
svg = svg.gsub(palette.fetch(background_name), palette.fetch("text"))
File.write(dst, svg)
RUBY
}

render_png assets/images/academy/kamailio.svg assets/png/academy/kamailio.png 1024 512
render_png assets/images/logo_default.svg assets/images/logo.png 88 88
render_png assets/images/name_og.svg assets/images/name_og.png 960 480
render_png assets/images/logo_default.svg assets/images/logo600square_default.png 563 563
render_png assets/images/logo_default.svg assets/images/android-chrome-192x192.png 192 192
render_png assets/images/logo_default.svg assets/images/android-chrome-512x512.png 512 512
render_png assets/images/logo_default.svg assets/images/apple-touch-icon.png 180 180
render_png assets/images/logo_default.svg assets/images/favicon-16x16.png 16 16
render_png assets/images/logo_default.svg assets/images/favicon-32x32.png 32 32
render_png assets/images/logo_default.svg assets/images/mstile-150x150.png 270 270
render_ico assets/images/logo_default.svg assets/images/favicon.ico
render_safari_mask assets/images/logo_default.svg assets/images/safari-pinned-tab.svg
