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
  stow tmux neovim spaceship \
  zsh-autosuggestions zsh-syntax-highlighting git-open \
  zoxide fzf yazi ffmpeg jq poppler fd ripgrep imagemagick \
  btop lazygit mas \
  mysql-client@8.0 redis postgresql mongosh

#######################################
# Brew casks
#######################################
echo "Installing Brew Casks..."
brew install --cask \
  arc \
  raycast termius datagrip orbstack beekeeper-studio \
  zoom discord megasync google-drive instantview time-out \
  sf-symbols font-hack-nerd-font

#######################################
# Mac App Store apps
#######################################
echo "Installing Mac App Store Apps..."
mas install 1510445899 || true # Meeter
mas install 441258766 || true # Magnet
mas install 1221250572 || true # Xnip
mas install 497799835 || true # Xcode

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
# Start core services
#######################################
echo "Starting services (permissions may be required)..."
brew services start skhd || true
brew services start sketchybar || true
brew services start borders || true
brew services start svim || true

#######################################
# OPTIONAL SCRIPTS
#######################################
echo "Running optional setup scripts..."

SCRIPTS_DIR="$DOTFILES_DIR/scripts"

run_optional() {
  local name="$1"
  local file="$SCRIPTS_DIR/$2"

  if [ "${!name:-false}" = "true" ] && [ -f "$file" ]; then
    echo "→ Running $2"
    zsh "$file"
  fi
}

# Terminals
run_optional INSTALL_KITTY "kitty.sh"
run_optional INSTALL_GHOSTTY "ghostty.sh"
run_optional INSTALL_ALACRITTY "alacritty.sh"

# Neovim extra setup
run_optional INSTALL_NVIM "nvim.sh"

# Docker databases
run_optional INSTALL_DATABASES "databases.sh"

# Sketchybar config
run_optional INSTALL_SKETCHYBAR "sketchybar.sh"

#######################################
# Done
#######################################
echo "Setup complete 🚀"
echo
echo "Optional flags you can use:"
echo "  INSTALL_KITTY=true"
echo "  INSTALL_GHOSTTY=true"
echo "  INSTALL_ALACRITTY=true"
echo "  INSTALL_NVIM=true"
echo "  INSTALL_DATABASES=true"
echo "  INSTALL_SKETCHYBAR=true"
