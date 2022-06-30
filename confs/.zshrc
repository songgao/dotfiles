source ~/.zplug/init.zsh

# zplug "larkery/zsh-histdb"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# =============================================================================

# histdb setups
# if which sqlite3 &> /dev/null; then
#   autoload -Uz add-zsh-hook
#   add-zsh-hook precmd  histdb-update-outcome
#   HISTDB_TABULATE_CMD=(column -t -s $'\x1f') # otherwise histdb cmd is broken
# fi

# save history
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell

# confirm history expansion
setopt hist_verify

# =============================================================================

# make completion work for keybase
zstyle ':completion:*' accept-exact-dirs true

# allows interactive comments
set -k

source $HOME/.rc

if [ -f $HOME/.rc.local ]; then
  source $HOME/.rc.local
fi

# arrow up/down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# enable starship
eval "$(starship init zsh)"
