#!/bin/sh
set -e

echo "Setting up Ghostty config..."

DOTFILES_DIR="$HOME/Projects/dotfiles"
GHOSTTY_CONFIG="$HOME/.config/ghostty"

# Ensure Ghostty config exists in dotfiles
if [ ! -d "$DOTFILES_DIR/.config/ghostty" ]; then
  echo "❌ Ghostty config not found in dotfiles."
  echo "Expected: $DOTFILES_DIR/.config/ghostty"
  exit 1
fi

# Backup existing config if present
if [ -d "$GHOSTTY_CONFIG" ]; then
  echo "Backing up existing Ghostty config..."
  mv "$GHOSTTY_CONFIG" "$GHOSTTY_CONFIG.backup.$(date +%s)"
fi

# Install config
echo "Installing Ghostty config..."
mkdir -p "$HOME/.config"
cp -r "$DOTFILES_DIR/.config/ghostty" "$HOME/.config/"

echo "✅ Ghostty config installed successfully."
echo "You can now launch Ghostty manually."