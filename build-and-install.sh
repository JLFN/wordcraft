#!/bin/bash
# Build and install WordCraft from this folder.
#
# Builds the release binary with the canonical builder at /data/build,
# installs it into ~/.local/bin, and installs the icon set and desktop entry.
# The builder copies the binary to ./bin/ and removes ./target afterwards, so
# the disk does not fill with build output.
set -euo pipefail

APP=wordcraft
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILDER=/data/build/linux/build.sh
BIN_DIR="$HOME/.local/bin"
ICON_DIR="$HOME/.local/share/icons"
APPS_DIR="$HOME/.local/share/applications"

# Optional build inputs, pinned by this repository: translations and fonts.
export CRAFT_I18N_DIR="${CRAFT_I18N_DIR:-/data/craft-i18n}"
export CRAFT_FONTS_DIR="${CRAFT_FONTS_DIR:-/data/craft-fonts}"

test -d "$CRAFT_I18N_DIR" || { echo "missing $CRAFT_I18N_DIR (craft-i18n at $(cat "$ROOT/craft-i18n.rev"))" >&2; exit 1; }
test -d "$CRAFT_FONTS_DIR" || { echo "missing $CRAFT_FONTS_DIR (craft-fonts checkout)" >&2; exit 1; }

echo "== build =="
bash "$BUILDER" -p "$ROOT" -b "$APP"

echo "== install =="
install -Dm755 "$ROOT/bin/$APP" "$BIN_DIR/$APP"
if [ -d "$ROOT/assets/app-icon/hicolor" ]; then
  mkdir -p "$ICON_DIR"
  cp -r "$ROOT/assets/app-icon/hicolor" "$ICON_DIR/"
fi
for desk in "$ROOT"/packaging/linux/*.desktop; do
  [ -e "$desk" ] || continue
  install -Dm644 "$desk" "$APPS_DIR/$(basename "$desk")"
  if [ -d "$HOME/Desktop" ]; then install -m755 "$desk" "$HOME/Desktop/$(basename "$desk")"; fi
done
command -v update-desktop-database >/dev/null && update-desktop-database "$APPS_DIR" || true
command -v gtk-update-icon-cache >/dev/null && gtk-update-icon-cache -f -t "$ICON_DIR/hicolor" || true

echo "installed $BIN_DIR/$APP"
