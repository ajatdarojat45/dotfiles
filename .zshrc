#######################################
# Homebrew (Apple Silicon) — MUST BE FIRST
#######################################
if [ -d /opt/homebrew/bin ]; then
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
fi

#######################################
# Oh My Zsh
#######################################
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  node
  npm
  github
  web-search
)

source "$ZSH/oh-my-zsh.sh"

#######################################
# Spaceship Prompt
#######################################
source /opt/homebrew/opt/spaceship/spaceship.zsh

#######################################
# NVM
#######################################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

#######################################
# Database Clients (Docker ONLY)
#######################################
# ✅ MySQL client (compatible with MySQL 8.x container)
export PATH="/opt/homebrew/opt/mysql-client@8.0/bin:$PATH"

# ✅ PostgreSQL client
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

#######################################
# Docker Database Shortcuts
#######################################
alias mysql-docker='mysql --protocol=TCP -h 127.0.0.1 -P 3306 -u root -p'
alias pg-docker='psql -h 127.0.0.1 -p 5432 -U postgres'
alias redis-docker='redis-cli -h 127.0.0.1 -p 6379'
alias mongo-docker='mongosh "mongodb://127.0.0.1:27017"'

#######################################
# Android SDK
#######################################
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"

#######################################
# Fastlane
#######################################
export PATH="$HOME/.fastlane/bin:$PATH"

#######################################
# Golang
#######################################
export GOPATH="$HOME/go"
export PATH="/usr/local/go/bin:$GOPATH/bin:$PATH"

#######################################
# PHP (Herd)
#######################################
export PATH="$HOME/Library/Application Support/Herd/bin:$PATH"

export HERD_PHP_83_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/83/"
export HERD_PHP_82_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/82/"
export HERD_PHP_81_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/81/"
export HERD_PHP_80_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/80/"
export HERD_PHP_74_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/74/"

#######################################
# fzf
#######################################
source <(fzf --zsh)

export FZF_DEFAULT_OPTS="--bind 'ctrl-j:down,ctrl-k:up'"

export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'
"

export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
"

export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'
"

#######################################
# Utility Functions
#######################################
findAll() {
  find . -name "$1" -prune | xargs du -chs
}

deleteDir() {
  find . -name "$1" -type d -prune | xargs rm -rf
}

fd() {
  local dir
  dir=$(find . -type d | fzf --preview "ls -la {}") && cd "$dir"
}

ff() {
  local file
  file=$(fzf --preview "bat --style=numbers --color=always {}") && nvim "$file"
}

#######################################
# yazi
#######################################
y() {
  local tmp="$(mktemp -t yazi-cwd.XXXXXX)"
  yazi "$@" --cwd-file="$tmp"
  if [ -s "$tmp" ]; then
    cd "$(cat "$tmp")"
  fi
  rm -f "$tmp"
}

#######################################
# zoxide
#######################################
eval "$(zoxide init zsh)"

#######################################
# Aliases
#######################################
alias python="python3"
alias pip="pip3"

alias ..="cd .."
alias ...="cd ../.."
alias c="clear"
alias cls="clear"

alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

alias l="ls -lah"
alias ll="ls -lAh"
alias ls="ls -G"

alias x="exit"
alias q="exit"

alias t="tmux"
alias v="nvim"
alias reload="source ~/.zshrc"

#######################################
# Git
#######################################
alias g="git"
alias ga="git add"
alias gc="git commit -m"
alias gco="git checkout"
alias gs="git status"
alias gl="git log --oneline --graph --decorate"

#######################################
# Conda (leave as-is)
#######################################
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ] && . "/opt/anaconda3/etc/profile.d/conda.sh"
fi
unset __conda_setup

#######################################
# macOS Ctrl+C fix
#######################################
stty intr ^C
trap - INT

#######################################
# Zsh Plugins (manual)
#######################################
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
