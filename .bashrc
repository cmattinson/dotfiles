export EDITOR=nvim

alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias camms="cd ~/workspace/camms-portal"
alias build="cd ~/workspace/camms-portal-build"
alias test="npx jest"
alias internal_uat="ssh -i ~/ubuntuserver.pem ubuntu@172.31.40.79"
alias deploy_internal="rsync -a --info=progress2 -e 'ssh -i ~/ubuntuserver.pem' ~/workspace/camms-portal ubuntu@172.31.40.79:/home/ubuntu/camms-portal-import"
alias grepr="grep -rHni --exclude-dir=node_modules --exclude-dir=app --exclude=index.js"
alias rg="rg -i"
alias nvc="cd ~/.config/nvim && nvim ."
alias nvp="cd ~/.local/share/nvim/"
alias psql="sudo -u postgres psql"
alias goose="goose postgres 'user=chris password=admin dbname=olympus sslmode=disable'"
alias oracle="ssh -i ~/oracle_private.key ubuntu@132.226.24.23"
alias website="cd ~/workspace/website"
alias dynamic="cd ~/workspace/camms-portal-dynamic"
alias shc="nvim ~/.config/starship.toml"
alias ws="cd ~/workspace"
alias chrome="/mnt/c/Program\ Files\/Google/Chrome/Application/chrome.exe"
alias cammsc="cd ~/workspace/camms"
alias n8="nvm use 8.9.3"
alias n14="nvm use 14.16.0"
alias rust="cd ~/workspace/rust"
alias pwr="cd ~/workspace/rust/programming_with_rust/"
alias nt="cd /mnt/c/Users/cmatt/Documents/notes"
alias .config="cd ~/.config"
alias wts="nvim /mnt/c/Users/cmatt/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"
alias .b="nvim ~/.bashrc"

export GOROOT=/usr/local/go
export GOPATH=$HOME/workspace/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$HOME/workspace/go/bin

export DB_USERNAME="chris"
export DB_PASSWORD="admin"
export DB_NAME="olympus"

export SPACESHIP_BATTERY_SHOW=false

eval "$(starship init bash)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

function colormap() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export COLORTERM=truecolor
