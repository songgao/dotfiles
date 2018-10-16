source ~/.zplug/init.zsh

# zplug mafredri/zsh-async, from:github
# zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
zplug "larkery/zsh-histdb"
zplug "zsh-users/zsh-autosuggestions"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# histdb setups
autoload -Uz add-zsh-hook
add-zsh-hook precmd histdb-update-outcome
HISTDB_TABULATE_CMD=(column -t -s $'\x1f')

source $HOME/.rc

