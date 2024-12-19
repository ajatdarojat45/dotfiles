#!/bin/sh

echo "Installing Dependencies"

# Install Neovim
brew install nvim

# Install VimPlug
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Clone config
echo "Cloning Config"
git clone https://github.com/ajatdarojat45/dotfiles.git /tmp/dotfiles
mv $HOME/.config/nvim $HOME/.config/nvim_backup
mv /tmp/dotfiles/.config/nvim $HOME/.config/nvim
rm -rf /tmp/dotfiles

# Install plugins
echo "Installing Plugins"
nvim -c 'PlugInstall' -c 'qa'

# Install Language Servers using Mason
echo "Installing Language Servers"
nvim -c 'MasonInstall lua_ls tsserver html cssls jsonls eslint' -c 'qa'

echo "Setup Complete!"

