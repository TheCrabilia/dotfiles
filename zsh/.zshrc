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

## Plugin manager
ZIM_HOME=$XDG_DATA_HOME/zim

# Download zimfw plugin manager if missing
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
    source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize modules
source ${ZIM_HOME}/init.zsh

## Load additional configuration files
source ${XDG_CONFIG_HOME}/zsh/init.zsh
