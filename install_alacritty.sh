#!/bin/sh

echo "Installing Dependencies"

# Install Alacritty
brew install alacritty

# Clone config
echo "Cloning Config"
git clone https://github.com/ajatdarojat45/dotfiles.git /tmp/dotfiles
mv $HOME/.config/alacritty $HOME/.config/alacritty_backup
mv /tmp/dotfiles/.config/alacritty $HOME/.config/alacritty
rm -rf /tmp/dotfiles

# Open Alacritty
alacritty &

echo "Setup Complete!"

