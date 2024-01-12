#!/usr/bin/env zsh

# disable global RCS files
unsetopt global_rcs

# XDG variables
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

## Set up path and fpath
typeset -aU path
typeset -aU fpath
path=(
    $HOME/.local/scripts
    $HOME/.local/bin
    /usr/local/bin
    /opt/homebrew/bin
    /opt/homebrew/sbin
    $HOME/.cargo/bin
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

export HIST_STAMPS="dd.mm.yyyy"
export HISTFILE=$XDG_CACHE_HOME/zsh/zsh_history
export HISTSIZE=20000
export SAVEHIST=10000

# Hide EOL sign ('%')
export PROMPT_EOL_MARK=""

# Set locale
export LC_ALL='en_US.UTF-8'
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
