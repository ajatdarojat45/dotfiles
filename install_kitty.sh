#!/bin/sh

echo "Installing Dependencies"

# Install Kitty
brew install kitty

# Clone config
echo "Cloning Config"
git clone https://github.com/ajatdarojat45/dotfiles.git /tmp/dotfiles
mv $HOME/.config/kitty $HOME/.config/kitty_backup
mv /tmp/dotfiles/.config/kitty $HOME/.config/kitty
rm -rf /tmp/dotfiles

# Open Kitty
kitty &

echo "Setup Complete!"

