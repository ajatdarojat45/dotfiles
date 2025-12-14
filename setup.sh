#!/bin/zsh
set -e

#######################################
# Xcode Command Line Tools
#######################################
echo "Checking Xcode CLI tools..."
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install
  echo "Please finish Xcode CLI Tools installation and rerun this script."
  exit 1
fi

#######################################
# Homebrew
#######################################
echo "Installing Homebrew..."
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Ensure brew is in PATH (Apple Silicon & Intel)
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

brew analytics off

#######################################
# Brew taps
#######################################
echo "Tapping Brew..."
brew tap FelixKratz/formulae
brew tap koekeishiya/formulae
brew tap mongodb/brew

#######################################
# Brew formulae
#######################################
echo "Installing Brew Formulae..."
brew install \
  skhd sketchybar borders yabai svim \
  stow tmux neovim \
  zsh-autosuggestions zsh-syntax-highlighting git-open \
  zoxide fzf yazi ffmpeg jq poppler fd ripgrep imagemagick \
  btop lazygit mas \
  mysql \
  postgresql@16 \
  mongodb-community \
  redis

#######################################
# Brew casks
#######################################
echo "Installing Brew Casks..."
brew install --cask \
  arc spaceship \
  raycast termius datagrip orbstack \
  zoom discord megasync google-drive instantview \
  sf-symbols font-hack-nerd-font

#######################################
# Mac App Store apps
#######################################
echo "Installing Mac App Store Apps..."
mas install 1510445899 || true # Meeter

#######################################
# Oh My Zsh
#######################################
echo "Installing Oh My Zsh..."

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh already installed."
fi

#######################################
# Dotfiles (Git + Stow)
#######################################
DOTFILES_DIR="$HOME/Projects/dotfiles"
REPO_URL="https://github.com/ajatdarojat45/dotfiles.git"
DOTFILES="dotfiles"

echo "Setting up dotfiles..."
mkdir -p "$(dirname "$DOTFILES_DIR")"

if [ ! -d "$DOTFILES_DIR" ]; then
  git clone "$REPO_URL" "$DOTFILES_DIR"
else
  cd "$DOTFILES_DIR" && git pull
fi

#######################################
# Protect existing .zshrc
#######################################
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
  echo "Backing up existing .zshrc before stow..."
  mv "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%s)"
fi

# Run stow from parent directory
cd "$(dirname "$DOTFILES_DIR")"
stow --restow -t "$HOME" "$DOTFILES"

#######################################
# Start services
#######################################
echo "Starting services (permissions may be required)..."

# Window manager / UI
brew services start skhd || true
brew services start sketchybar || true
brew services start borders || true
brew services start svim || true

# Databases
brew services start mysql || true
brew services start postgresql@16 || true
brew services start redis || true

# MongoDB (optional)
# brew services start mongodb-community || true

#######################################
# Done
#######################################
echo "Setup complete 🚀"
echo "NOTE:"
echo "- Grant Accessibility permissions for yabai / skhd / svim"
echo "- Disable SIP if you want advanced yabai features"
echo "- MongoDB service is installed but NOT started by default"
