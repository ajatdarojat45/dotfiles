#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Homebrew
## Install
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Taps
echo "Tapping Brew..."
brew tap FelixKratz/formulae
brew tap koekeishiya/formulae

## Formulae
echo "Installing Brew Formulae..."
### Essentials
brew install skhd
brew install sketchybar
brew install borders
brew install yabai
brew install svim

### Terminal
brew install stow
brew install tmux
brew install neovim
brew install zsh-autosuggestions
brew install zoxide
brew install fzf
brew install yazi ffmpeg sevenzip jq poppler fd ripgrep  imagemagick font-symbols-only-nerd-font

### Nice to have
brew install btop
brew install svim
brew install lazygit
brew install dooit

## Casks
echo "Installing Brew Casks..."
### Terminals & Browsers
brew install --cask kitty
brew install --cask arc

### Support
brew install --cask raycast
brew install --cask termius
brew install --cask datagrip
brew install --cask orbstack

### Communication
brew install --cask zoom
brew install --cask discord

### Nice to have
brew install --cask megasync
brew install --cask google-drive
brew install --cask instantview

### Fonts
brew install --cask sf-symbols
brew install --cask font-hack-nerd-font

# Mac App Store Apps
echo "Installing Mac App Store Apps..."
mas install 1510445899 #Meeter

# Copying and checking out configuration files
DOTFILES_DIR=~/project/dotfiles
REPO_URL="https://github.com/username/dotfiles.git" # Ganti dengan URL repository Anda

# Clone repository if folder does not exist 
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Cloning dotfiles repository..."
  git clone "$REPO_URL" "$DOTFILES_DIR"
else
  echo "Dotfiles directory already exists. Pulling latest changes..."
  cd "$DOTFILES_DIR" && git pull
fi

# cd to dotfiles directory
cd "$DOTFILES_DIR" || exit

# Gunakan GNU Stow untuk menautkan dotfiles ke ~
echo "Running stow to link dotfiles..."
stow --target="$HOME" *

# Installing Fonts
git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/

curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.28/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

source $HOME/.zshrc

# Start Services
echo "Starting Services (grant permissions)..."
brew services start skhd
brew services start yabai
brew services start sketchybar
brew services start borders
brew services start svim

csrutil status
echo "(optional) Disable SIP for advanced yabai features."
echo "(optional) Add sudoer manually:\n '$(whoami) ALL = (root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | awk "{print \$1;}") $(which yabai) --load-sa' to '/private/etc/sudoers.d/yabai'"
echo "Installation complete...\n"
