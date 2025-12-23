#!/bin/sh
set -e

echo "Setting up Kitty config..."

DOTFILES_DIR="$HOME/Projects/dotfiles"
KITTY_CONFIG="$HOME/.config/kitty"

# Ensure Kitty config exists in dotfiles
if [ ! -d "$DOTFILES_DIR/.config/kitty" ]; then
  echo "❌ Kitty config not found in dotfiles."
  echo "Expected: $DOTFILES_DIR/.config/kitty"
  exit 1
fi

# Backup existing config if present
if [ -d "$KITTY_CONFIG" ]; then
  echo "Backing up existing Kitty config..."
  mv "$KITTY_CONFIG" "$KITTY_CONFIG.backup.$(date +%s)"
fi

# Install config
echo "Installing Kitty config..."
mkdir -p "$HOME/.config"
cp -r "$DOTFILES_DIR/.config/kitty" "$HOME/.config/"

echo "✅ Kitty config installed successfully."
echo "You can now launch Kitty manually."