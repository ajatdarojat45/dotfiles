#!/bin/sh
set -e

echo "Setting up SketchyBar config..."

DOTFILES_DIR="$HOME/Projects/dotfiles"
SKETCHYBAR_CONFIG="$HOME/.config/sketchybar"

#######################################
# Sanity check
#######################################
if [ ! -d "$DOTFILES_DIR/.config/sketchybar" ]; then
  echo "❌ SketchyBar config not found in dotfiles."
  echo "Expected: $DOTFILES_DIR/.config/sketchybar"
  exit 1
fi

#######################################
# Backup existing config
#######################################
if [ -d "$SKETCHYBAR_CONFIG" ]; then
  echo "Backing up existing SketchyBar config..."
  mv "$SKETCHYBAR_CONFIG" "$SKETCHYBAR_CONFIG.backup.$(date +%s)"
fi

#######################################
# Install config
#######################################
echo "Installing SketchyBar config..."
mkdir -p "$HOME/.config"
cp -r "$DOTFILES_DIR/.config/sketchybar" "$HOME/.config/"

#######################################
# Restart SketchyBar if available
#######################################
if command -v sketchybar >/dev/null 2>&1; then
  echo "Restarting SketchyBar..."
  brew services restart sketchybar || true
else
  echo "⚠️ sketchybar not found. Install it first."
fi

echo "✅ SketchyBar setup complete."