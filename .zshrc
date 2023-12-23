# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
export EDITOR=nvim

alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias camms="cd ~/workspace/method1/camms-portal"
alias van="cd ~/workspace/vantix"
alias ios="cd ~/workspace/ios"
alias kmm="cd ~/workspace/kmm"
alias svan="ssh vantixsystems@20.51.122.194"
alias atms="cd ~/workspace/vantix/atms-administration"
alias crm="cd ~/workspace/vantix/crm"
alias base="cd ~/workspace/vantix/crm-base"
alias dash="cd ~/workspace/method1/camms-dashboards"
alias nsc="cd ~/Library/Application\ Support/nushell"
alias chris_int="ssh chris@172.31.40.79"
alias nvim-upgrade="brew upgrade neovim --fetch-HEAD"
alias grep="grep --color=auto"
alias grepr="grep -rHni --exclude-dir=node_modules --exclude-dir=app --exclude=index.js"
alias nvc="cd ~/.config/nvim && nvim ."
alias psql="sudo -u postgres psql"
alias oracle="ssh ubuntu@129.146.22.41"
alias shc="nvim ~/.config/starship.toml"
alias ws="cd ~/workspace"
alias rust="cd ~/workspace/rust"
alias .config="cd ~/.config"
alias .z="nvim ~/.zshrc"
alias .sz="source ~/.zshrc"
alias wtc="nvim ~/.config/wezterm/wezterm.lua"
alias ffd="cd \$(fd --type d . ~/workspace | fzf)"
alias ffc="nvim \$(fd --type f . ~/.config | fzf)"
alias aoc="cd ~/workspace/rust/advent-of-code"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fpath=($fpath "/home/chris/.zfunctions")

cd $HOME/workspace

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
