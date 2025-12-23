#!/bin/sh
set -e

echo "Setting up Alacritty config..."

DOTFILES_DIR="$HOME/Projects/dotfiles"
ALACRITTY_CONFIG="$HOME/.config/alacritty"

# Ensure dotfiles exist
if [ ! -d "$DOTFILES_DIR/.config/alacritty" ]; then
  echo "❌ Alacritty config not found in dotfiles."
  echo "Expected: $DOTFILES_DIR/.config/alacritty"
  exit 1
fi

# Backup existing config if present
if [ -d "$ALACRITTY_CONFIG" ]; then
  echo "Backing up existing Alacritty config..."
  mv "$ALACRITTY_CONFIG" "$ALACRITTY_CONFIG.backup.$(date +%s)"
fi

# Install config
echo "Installing Alacritty config..."
mkdir -p "$HOME/.config"
cp -r "$DOTFILES_DIR/.config/alacritty" "$HOME/.config/"

echo "✅ Alacritty config installed successfully."