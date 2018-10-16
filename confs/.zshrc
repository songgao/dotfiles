source ~/.zplug/init.zsh

# zplug mafredri/zsh-async, from:github
# zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
zplug 'larkery/zsh-histdb', use:sqlite-history.zsh
zplug 'zsh-users/zsh-autosuggestions'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

source $HOME/.rc

