# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

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
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git pyenv)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/texbin:$PATH

if [[ $(uname) == 'Darwin' ]]
then
    # GNU coreutils
    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

    # node.js / io.js
    export PATH=$PATH:/usr/local/share/npm/bin
fi

if [[ $(uname) == 'FreeBSD' ]]
then
  alias ls="ls -Ghl"
else
  alias ls="ls --color=always -hl --time-style=long-iso --group-directories-first"
fi

export EDITOR="vim"
alias less="less -R"
alias grep="grep --color=always"

# Python
alias py2="source $HOME/envs/python2/bin/activate"
alias py3="source $HOME/envs/python3/bin/activate"

# Go
export GOROOT=$HOME/go
export GOPATH=$HOME/gopath
export GOBIN=$GOPATH/bin
export PATH=$GOROOT/bin:$GOBIN:$PATH
alias gf="gofmt -s -w -e -l"
if which colorgo &> /dev/null; then alias go="colorgo"; fi

if [ -f $HOME/.rc ]; then . $HOME/.rc; fi
