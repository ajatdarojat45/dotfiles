# aliases
alias python="python3"
alias pip="pip3"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# plugins
plugins=(
  git
  zsh-autosuggestions
  node
  npm
  github
  zsh-syntax-highlighting
  git-open
  web-search
)

source $ZSH/oh-my-zsh.sh
source /Users/ajatdarojat45/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
source /opt/homebrew/opt/spaceship/spaceship.zsh

# ANDROID_HOME
export ANDROID_HOME=/Users/USERNAME/Library/Android/sdk 
export PATH=${PATH}:${ANDROID_HOME}/tools 
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

export PATH="$HOME/.fastlane/bin:$PATH"
export PATH="$HOME/.fastlane/bin/fastlane_lib:$PATH"

# fzf
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="--bind 'Ctrl-j:down,Ctrl-k:up'"

export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

## find file and directory
function findAll(){
  find . -name "$1" -prune | xargs du -chs
}

# delete directory
function deleteDir(){
  find . -name "$1" -type d -prune | xargs rm -rf
}

# Fuzzy CD ke direktori
fcd() {
  local dir
  dir=$(find . -type d | fzf --preview "ls -la {}") && cd "$dir"
}

# Cari file dan buka di editor favorit
ff() {
  local file
  file=$(fzf --preview "bat --style=numbers --color=always {}") && nvim "$file"
}

fh() {
  local cmd
  cmd=$(history | fzf --preview "echo {}" --height=40% --reverse --bind "Ctrl-r:reload(history)" --tiebreak=index) 
  if [[ -n $cmd ]]; then
    # Eksekusi perintah yang dipilih
    eval "$(echo $cmd | sed -E 's/^[ ]*[0-9]+\*?[ ]+//')"
  fi
}

## PHPBrew
export PHPBREW_SET_PROMPT=1
export PHPBREW_RC_ENABLE=1
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc


# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/ajatdarojat45/Library/Application Support/Herd/config/php/83/"


# Herd injected PHP binary.
export PATH="/Users/ajatdarojat45/Library/Application Support/Herd/bin/":$PATH


# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/ajatdarojat45/Library/Application Support/Herd/config/php/82/"


# Herd injected PHP 7.4 configuration.
export HERD_PHP_74_INI_SCAN_DIR="/Users/ajatdarojat45/Library/Application Support/Herd/config/php/74/"


# Herd injected PHP 8.1 configuration.
export HERD_PHP_81_INI_SCAN_DIR="/Users/ajatdarojat45/Library/Application Support/Herd/config/php/81/"


# Herd injected PHP 8.0 configuration.
export HERD_PHP_80_INI_SCAN_DIR="/Users/ajatdarojat45/Library/Application Support/Herd/config/php/80/"
export PATH="/opt/homebrew/opt/mysql@8.4/bin:$PATH"

# Golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# starship
eval "$(starship init zsh)"
