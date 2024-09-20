# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
export EDITOR=nvim

alias .colors="cd ~/dotfiles/.config/color-scripts"
alias .config="cd ~/dotfiles/.config"
alias .sz="source ~/.zshrc"
alias .z="nvim ~/dotfiles/.zshrc"
alias algo="cd ~/workspace/algorithms"
alias aoc="cd ~/workspace/advent-of-code"
alias atms="cd ~/workspace/vantix/atms-administration"
alias base="cd ~/workspace/vantix/crm-base"
alias bformat="npx @biomejs/biome format"
alias blint="npx @biomejs/biome format"
alias camms="cd ~/workspace/method1/camms-portal"
alias chris_int="ssh chris@172.31.40.79"
alias cl="cd ~/workspace/vantix/crm/client"
alias crm="cd ~/workspace/vantix/crm"
alias dash="cd ~/workspace/method1/camms-dashboards"
alias dn="cd ~/workspace/vantix/crm/api-dotnet"
alias dot="cd ~/dotfiles"
alias dra="~/.config/color-scripts/dragon.sh"
alias ffd="cd \$(fd --type d . ~/dotfiles ~/workspace ~/Exercism | fzf)"
alias grep="grep --color=auto"
alias grepr="grep -rHni --exclude-dir=node_modules --exclude-dir=app --exclude=index.js"
alias ios="cd ~/workspace/ios"
alias kmm="cd ~/workspace/kmm"
alias ll='ls -lh --color=auto'
alias ls='ls --color=auto'
alias matd="~/.config/color-scripts/material-dark.sh"
alias matl="~/.config/color-scripts/material-light.sh"
alias mel="~/.config/color-scripts/mellifluous.sh"
alias nd="cd ~/workspace/vantix/crm/api-node"
alias nsc="cd ~/Library/Application\ Support/nushell"
alias nvc="cd ~/dotfiles/.config/nvim && nvim"
alias nvim-upgrade="brew upgrade neovim --fetch-HEAD"
alias oracle="ssh ubuntu@129.146.22.41"
alias psql="sudo -u postgres psql"
alias ros="~/.config/color-scripts/rose-pine.sh"
alias rust="cd ~/workspace/rust"
alias shc="nvim ~/dotfiles/.config/starship.toml"
alias svan="ssh vantixsystems@20.51.122.194"
alias van="cd ~/workspace/vantix"
alias vim="nvim"
alias ws="cd ~/workspace"
alias wtc="nvim ~/dotfiles/.config/wezterm/wezterm.lua"
alias yd="cd ~/workspace/vantix/atms-yellowdog"
alias ydc="cd ~/workspace/vantix/atms-yellowdog/src/yellowdog.react"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fpath=($fpath "/home/chris/.zfunctions")

cd $HOME

export GOROOT=/usr/local/go
export GOPATH=$HOME/workspace/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$HOME/workspace/go/bin

# export DISPLAY=$(route.exe print | grep 0.0.0.0 | head -1 | awk '{print $4}'):0.0

export SPACESHIP_BATTERY_SHOW=false

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function colormap() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

set +H
export PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"

PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
export PATH
export PATH="$PATH:`yarn global bin`"
export PATH=$PATH:/usr/local/share/dotnet
export DOTNET_ROOT=/usr/local/share/dotnet
export PATH=$PATH:$DOTNET_ROOT
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

# opam configuration
[[ ! -r /Users/chris/.opam/opam-init/init.zsh ]] || source /Users/chris/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Created by `pipx` on 2024-06-17 22:32:14
export PATH="$PATH:/Users/chris/.local/bin"
export PATH="/opt/homebrew/opt/llvm@14/bin:$PATH"
export PATH="/Users/chris/workspace/odin/compiler:$PATH"
export PATH="/Users/chris/workspace/odin/ols:$PATH"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

