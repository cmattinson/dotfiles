# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
export EDITOR=nvim

# home-manager
if [ -e "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
  . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
fi

alias .colors="cd ~/dotfiles/.config/color-scripts"
alias .config="cd ~/dotfiles/.config"
alias .sz="source ~/.zshrc"
alias .z="nvim ~/dotfiles/.zshrc"
alias aoc="cd ~/workspace/advent-of-code"
alias bformat="npx @biomejs/biome format"
alias blint="npx @biomejs/biome format"
alias biome-init="bun add -D -E @biomejs/biome && bunx --bun biome init"
alias chris_int="ssh chris@172.31.40.79"
alias dot="cd ~/dotfiles"
alias dra="~/.config/color-scripts/dragon.sh"
alias ffd="cd \$(fd --type d . ~/dotfiles ~/workspace ~/Exercism | fzf)"
alias grep="grep --color=auto"
alias grepr="grep -rHni --exclude-dir=node_modules --exclude-dir=app --exclude=index.js"
alias ll="ls -lh --color=auto"
alias ls="ls --color=auto"
alias ayu="~/.config/color-scripts/ayu-dark.sh"
alias matd="~/.config/color-scripts/material-dark.sh"
alias matl="~/.config/color-scripts/material-light.sh"
alias mel="~/.config/color-scripts/mellifluous.sh"
alias nord="~/.config/color-scripts/nordic.sh"
alias nsc="cd ~/Library/Application\ Support/nushell"
alias nvc="cd ~/dotfiles/.config/nvim && nvim"
alias oracle="ssh ubuntu@129.153.99.130"
alias psql="sudo -u postgres psql"
alias ros="~/.config/color-scripts/rose-pine.sh"
alias catp="~/.config/color-scripts/catppuccin.sh"
alias evf="~/.config/color-scripts/everforest.sh"
alias gh="~/.config/color-scripts/github.sh"
alias kana="~/.config/color-scripts/kanagawa.sh"
alias kin="~/.config/color-scripts/kintsugi.sh"
alias luc="~/.config/color-scripts/lucent-orng.sh"
alias oas="~/.config/color-scripts/oasis.sh"
alias tok="~/.config/color-scripts/tokyonight.sh"
alias ves="~/.config/color-scripts/vesper.sh"
alias rust="cd ~/workspace/rust"
alias shc="nvim ~/dotfiles/.config/starship.toml"
alias vim="nvim"
alias ws="cd ~/workspace"
alias wtc="nvim ~/dotfiles/.config/wezterm/wezterm.lua"
alias exe="cd ~/Exercism"
alias gtc="nvim ~/dotfiles/.config/ghostty/config"
alias nix-develop='nix develop -c zsh'

fpath=($fpath "/home/chris/.zfunctions")

# cd $HOME

export GOROOT=/usr/local/go
export GOPATH=$HOME/workspace/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$HOME/workspace/go/bin
export PATH=$PATH:$HOME/.docker/bin

# export DISPLAY=$(route.exe print | grep 0.0.0.0 | head -1 | awk '{print $4}'):0.0

export SPACESHIP_BATTERY_SHOW=false

eval "$(starship init zsh)"

# fzf
if [ -e "$HOME/.nix-profile/share/fzf" ]; then
  source "$HOME/.nix-profile/share/fzf/key-bindings.zsh"
  source "$HOME/.nix-profile/share/fzf/completion.zsh"
fi



function colormap() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

set +H
export PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"

PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
export PATH
export DOCKER_BUILDKIT=1
source ~/config.sh
[[ $commands[kubectl] ]] && source <(kubectl completion zsh) # add autocomplete permanently to your zsh shell
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"


# bun completions
[ -s "/Users/chris/.bun/_bun" ] && source "/Users/chris/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Created by `pipx` on 2024-06-17 22:32:14
export PATH="$PATH:/Users/chris/.local/bin"
export PATH="/opt/homebrew/opt/llvm@14/bin:$PATH"
export PATH="/Users/chris/workspace/odin/compiler:$PATH"
export PATH="/Users/chris/workspace/odin/ols:$PATH"

export PATH="/Users/chris/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/chris/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# opencode
export PATH=/Users/chris/.opencode/bin:$PATH
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/chris/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

[ -f "/Users/chris/.ghcup/env" ] && . "/Users/chris/.ghcup/env" # ghcup-env
