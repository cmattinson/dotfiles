# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/chris/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dracula"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR=nvim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias camms="cd ~/workspace/camms-portal"
alias build="cd ~/workspace/camms-portal-build"
alias oly="cd ~/workspace/olympus"
alias olys="cd ~/workspace/olympus/server"
alias olyc="cd ~/workspace/olympus/client"
alias wp="npx webpack"
alias wpd="npx webpack --mode development"
alias wpp="npx webpack --mode production"
alias redis="sudo service redis-server restart"
alias refresh="node service --refreshrules"
alias inspect="sudo "$(which node)" --inspect service"
alias clean="rm -rf ~/workspace/camms-portal/app/*"
alias test="npx jest"
alias internal_uat="ssh -i ~/ubuntuserver.pem ubuntu@172.31.40.79"
alias deploy_internal="rsync -a --info=progress2 -e 'ssh -i ~/ubuntuserver.pem' ~/workspace/camms-portal ubuntu@172.31.40.79:/home/ubuntu/camms-portal-import"
alias nvim="nvm use 14.16.0 && nvim"
alias grepr="grep -rHni --exclude-dir=node_modules --exclude-dir=app --exclude=index.js"
alias rg="rg -i"
alias nvc="cd ~/.config/nvim && nvim ."
alias nvp="cd ~/.local/share/nvim/"
alias psql="sudo -u postgres psql"
alias goose="goose postgres 'user=chris password=admin dbname=olympus sslmode=disable'"
alias subl="/mnt/c/Program\ Files/'Sublime Text'/subl.exe"
alias oracle="ssh -i ~/oracle_private.key ubuntu@132.226.24.23"
alias website="cd ~/workspace/website"
alias dynamic="cd ~/workspace/camms-portal-dynamic"
alias shc="nvim ~/.config/starship.toml"
alias ws="cd ~/workspace"
alias chrome="/mnt/c/Program\ Files\/Google/Chrome/Application/chrome.exe"
alias start-camms="cmd.exe /c 'wt.exe'; split-pane -V camms && npm run service"
alias cammsc="cd ~/workspace/camms"
alias n8="nvm use 8.9.3"
alias n14="nvm use 14.16.0"
alias rust="cd ~/workspace/rust"
alias nt="cd /mnt/c/Users/cmatt/Documents/notes"

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

export DB_USERNAME="chris"
export DB_PASSWORD="admin"
export DB_NAME="olympus"

export DISPLAY=$(route.exe print | grep 0.0.0.0 | head -1 | awk '{print $4}'):0.0

export SPACESHIP_BATTERY_SHOW=false

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function colormap() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}
