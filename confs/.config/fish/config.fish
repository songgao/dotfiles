set -x PATH $HOME/.local/bin $HOME/bin /usr/local/bin /usr/local/sbin $PATH

if [ (uname) = 'Darwin' ]
    # GNU coreutils
    set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
    set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
end

alias less="less -R"
alias grep="grep --color=always"
alias p8="ping 8.8.8.8"

# Go
set -x GOROOT $HOME/go
set -x GOPATH $HOME/gopath
set -x GOBIN $GOPATH/bin
set -x PATH $GOROOT/bin $GOBIN $PATH
alias gf="gofmt -s -w -e -l"
if which colorgo >/dev/null ^/dev/null
    alias go="colorgo"
end

# Editors
set -x VISUAL "nvim"
set -x EDITOR "$VISUAL"
alias vim=nvim

# exa
alias l='exa -l --time-style long-iso'
alias t='exa -l --tree --time-style long-iso'

# powerline prompt
if which powerline-go >/dev/null ^/dev/null
    function fish_prompt
        powerline-go -error $status -shell bare
    end
end

# source ~/.rc.fish.local  
if test -e ~/.rc.fish.local
    source ~/.rc.fish.local
end

function v
    if count $argv > /dev/null
        nvim $argv
    else
        vim (fzf --preview 'highlight -O xterm256 -s nightshimmer {}' --preview-window=right:70%)
    end
end
