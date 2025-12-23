#!/bin/sh
set -e

echo "Setting up Neovim config (lazy.nvim)..."

DOTFILES_DIR="$HOME/Projects/dotfiles"
NVIM_CONFIG="$HOME/.config/nvim"

# Ensure Neovim config exists in dotfiles
if [ ! -d "$DOTFILES_DIR/.config/nvim" ]; then
  echo "❌ Neovim config not found in dotfiles."
  echo "Expected: $DOTFILES_DIR/.config/nvim"
  exit 1
fi

# Backup existing Neovim config if present
if [ -d "$NVIM_CONFIG" ]; then
  echo "Backing up existing Neovim config..."
  mv "$NVIM_CONFIG" "$NVIM_CONFIG.backup.$(date +%s)"
fi

# Install config
echo "Installing Neovim config..."
mkdir -p "$HOME/.config"
cp -r "$DOTFILES_DIR/.config/nvim" "$HOME/.config/"

# Trigger lazy.nvim + Mason install (headless)
echo "Installing plugins & tools via lazy.nvim..."
nvim --headless "+Lazy! sync" +qa

echo "✅ Neovim setup complete."