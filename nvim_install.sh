echo "Installing Dependencies"
# Packages
brew install nvim

# Install package  manager - VimPlug
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Cloning Config"
git clone https://github.com/ajatdarojat45/dotfiles.git /tmp/dotfiles
mv $HOME/.config/nvim $HOME/.config/nvim_backup
mv /tmp/dotfiles/.config/nvim $HOME/.config/nvim
rm -rf /tmp/dotfiles
