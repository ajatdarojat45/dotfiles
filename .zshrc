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
fd() {
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

# yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# zoxide
eval "$(zoxide init zsh)"

# aliases
## python
alias python="python3"
alias pip="pip3"

## Navigation and file management
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias c="clear"
alias cls="clear"
alias cz="clear && exit"

alias mkdir="mkdir -p"
alias rm="rm -i"   # Konfirmasi sebelum menghapus file
alias rmr="rm -rf -i"   # Konfirmasi sebelum menghapus direktori
alias cp="cp -i"   # Konfirmasi sebelum menyalin
alias cpr="cp -r -i"   # Konfirmasi sebelum menyalin
alias mv="mv -i"   # Konfirmasi sebelum memindahkan
alias l="ls -lah"
alias ll="ls -lAh"
alias ls="ls -G"   # Jika di macOS, gunakan `ls -G`
alias df="df -h"  # Cek penggunaan disk
alias free="vm_stat"  # Cek penggunaan RAM di macOS


## Tmux
alias t="tmux"

## Nvim
alias v="nvim"
alias vrc="nvim ~/.zshrc"
alias vtmux="nvim ~/.tmux.conf"
alias vinit="nvim ~/.config/nvim/init.lua"
alias vplug="nvim ~/.vimrc"
alias vsession="nvim -S Session.vim"
alias vgrep="grep -rnw ."

## Git
alias g="git"
alias ga="git add"
alias gc="git commit -m"
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"
alias gcl="git clone"
alias gpl="git pull"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gco="git checkout"
alias gs="git status"
alias gl="git log --oneline --graph --decorate"
alias gb="git branch"
alias gd="git diff"
alias gst="git stash"
alias gstp="git stash pop"

## Node
alias nodev="node -v"
alias nodemon="npx nodemon"
alias npkg="cat package.json | jq '.dependencies'"
alias npkgl="cat package-lock.json | jq '.dependencies'"
alias tsx="npx tsx"  # Jalankan file TypeScript tanpa compile
alias tsc="npx tsc"  # Compile TypeScript
alias lint="npx eslint . --fix"

## NPM
alias ni="npm install"
alias nr="npm run"
alias ns="npm start"
alias nt="npm test"
alias nrd="npm run dev"
alias nrb="npm run build"
alias nrg="npm run generate"
alias npx="npx"

## Terminal & System
alias x="exit"
alias q="exit"
alias bye="exit"
alias restart-zsh="exec zsh"
alias reload="source ~/.zshrc"
alias hist="history | grep"
alias path="echo $PATH | tr ':' '\n'"
alias myip="curl ifconfig.me"
alias ports="lsof -i -P -n | grep LISTEN"
alias ping="ping -c 5"

