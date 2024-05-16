#!/usr/bin/env zsh

# zmodload zsh/zprof

## Set up path and fpath
typeset -aU path
typeset -aU fpath
path=(
    $HOME/.local/scripts
    $HOME/.local/bin
    $HOME/.local/share/nvim/mason/bin
    $HOME/.cargo/bin
    /opt/homebrew/bin
    /opt/homebrew/sbin
    /usr/local/bin
    /usr/bin
    /usr/sbin
    /bin
    /sbin
)
fpath=(
    /opt/homebrew/share/zsh/site-functions
    /opt/homebrew/share/zsh/functions
    $XDG_DATA_HOME/zsh/site-functions
    $XDG_CONFIG_HOME/zsh/site-functions
)

export SHELL=$(which zsh)

# Default pager
(( ${+commands[less]} )) && () {
    export LESS=-r
    export PAGER=less
}

# Set default editor
for editor in nvim vim vi nano; do
    (( ${+commands[$editor]} )) && () {
        export EDITOR=$editor
        break
    }
done

ANTIDOTE_HOME=$HOME/.cache/antidote
ABBR_DEFAULT_BINDINGS=0
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HISTORY_IGNORE=("git *| rsync *| scp *")
ZSH_AUTOSUGGEST_COMPLETION_IGNORE=("git *| rsync *| scp *")

# Clone antidote if necessary
[[ -e ${ZDOTDIR:-~}/.antidote ]] || git clone https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote

source ${ZDOTDIR:-~}/.antidote/antidote.zsh
source <(antidote init)

antidote bundle <<EOBUNDLES
    chrissicool/zsh-256color
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-completions
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-history-substring-search

    mroth/evalcache
    olets/zsh-abbr
    # mafredri/zsh-async
    romkatv/zsh-bench kind:path
    hlissner/zsh-autopair
EOBUNDLES

## Load custom configuration files
source ${XDG_CONFIG_HOME}/zsh/init.zsh

antidote bundle <<EOBUNDLES
    ohmyzsh/ohmyzsh path:plugins/azure
EOBUNDLES

_evalcache fzf --zsh
_evalcache zoxide init zsh --cmd cd
eval "$(mise activate zsh)"
