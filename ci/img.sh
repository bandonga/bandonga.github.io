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
else
  cat >&2 <<'EOF'
No SVG renderer found.

Install one of:
  - inkscape
  - librsvg, providing rsvg-convert
  - imagemagick, providing magick
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
  esac
}

render_ico() {
  local src="$1"
  local dst="$2"

  if ! command -v magick >/dev/null 2>&1; then
    echo "Skipping $dst; ICO generation requires ImageMagick's magick command." >&2
    return
  fi

  magick -background none "$src" \
    -define icon:auto-resize=16,32,48 \
    "$dst"
}

for src in assets/svg/academy/*.svg; do
  name="$(basename "$src" .svg)"
  render_png "$src" "assets/png/academy/${name}.png" 1024 512
done

for name in linux sip sysadmin telephony webrtc; do
  render_png "assets/images/academy/${name}.svg" "assets/images/academy/${name}.png" 1024 512
done

render_png assets/images/name_og.svg assets/images/name_og.png 960 480
render_png assets/images/logo_default.svg assets/images/logo600square_default.png 563 563
render_png assets/images/logo_default.svg assets/images/android-chrome-192x192.png 192 192
render_png assets/images/logo_default.svg assets/images/android-chrome-512x512.png 512 512
render_png assets/images/logo_default.svg assets/images/apple-touch-icon.png 180 180
render_png assets/images/logo_default.svg assets/images/favicon-16x16.png 16 16
render_png assets/images/logo_default.svg assets/images/favicon-32x32.png 32 32
render_png assets/images/logo_default.svg assets/images/mstile-150x150.png 270 270
render_ico assets/images/logo_default.svg assets/images/favicon.ico
