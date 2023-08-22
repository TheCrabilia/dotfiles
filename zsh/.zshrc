#!/usr/bin/env zsh

# zmodload zsh/zprof

## Plugin manager
ZIM_HOME=$XDG_DATA_HOME/zim

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
    $fpath
)

zstyle ':zim:completion' dumpfile ${XDG_CACHE_HOME}/zsh/zcompdump
zstyle ':zim:completion' compcache ${XDG_CACHE_HOME}/zsh/zcompcache
zstyle ':zim:completion' case-sensitivity sensitive
zstyle ':zim:glob' case-sensitivity sensitive

zstyle ':crb:environment:history' histfile $XDG_CACHE_HOME/zsh/zsh_history

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
    source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize modules.
source ${ZIM_HOME}/init.zsh

# Load additional configuration
local entrypoint=${XDG_CONFIG_HOME}/zsh/init.zsh
if [[ ! -e ${entrypoint}.zwc || ${entrypoint}.zwc -ot ${entrypoint} ]]; then
    zcompile -Uz ${entrypoint}
fi
source ${entrypoint}
unset entrypoint
