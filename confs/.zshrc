# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git virtualenv rvm)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

LS_CMD="ls"

if [[ $(uname) == 'Darwin' ]]
then
    alias vim=/usr/local/Cellar/macvim/7.4-73/MacVim.app/Contents/MacOS/Vim
    export EDITOR='/usr/local/Cellar/macvim/7.4-73/MacVim.app/Contents/MacOS/Vim'
    LS_CMD="gls"
    alias diff="colordiff"
fi

alias ls="$LS_CMD --color=always -hl --time-style=long-iso"
alias less="less -R"
alias grep="grep --color=always"
alias go="colorgo"

alias sl="sl -a"
alias gf="gofmt -s -w -e -l"
alias ssh_nocheck="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"

export PATH=/usr/texbin:$PATH
export PATH=$HOME/repo/luvit/build/:$PATH

export GOROOT=$HOME/go
export PATH=$GOROOT/bin:$PATH

export OLD_PATH=$PATH
set_gopath() {
  export GOPATH=$(grealpath $1)
  export GOBIN=$GOPATH/bin
  export PATH=$GOBIN:$OLD_PATH
  if which colorgo &> /dev/null
  then
    alias go="colorgo"
  else
    unalias go
  fi
}
set_gopath $HOME/gopath
