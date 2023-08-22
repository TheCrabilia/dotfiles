#!/usr/bin/env zsh

autoload -Uz add-zsh-hook
autoload -Uz vcs_info

## Set up path and fpath
typeset -aU path
typeset -aU fpath

path=(
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
    /opt/homebrew/share/zsh/functions
    /opt/homebrew/share/zsh/site-functions
    $XDG_DATA_HOME/zsh/site-functions
    $XDG_CONFIG_HOME/zsh/site-functions
)

## Load zsh functions
local autoloaded_functions=(
    dotfiles
    flushdns
    timezsh
)
for func in ${0:h:a}/site-functions/^(*.zwc)(N); do
    if [[ ! -e ${func}.zwc || ${func}.zwc -ot ${func} ]]; then
        zcompile -Uz ${func}
    fi
    if (( ${autoloaded_functions[(Ie)${func:t}]} )); then
        autoload -Uz ${func}
    fi
done
unset autoloaded_functions

## Hooks
local corp_proxy="off"

# Auto ls
autoload -Uz _auto_ls
add-zsh-hook chpwd _auto_ls

# Proxy auto configuration for corporate network
if [[ $corp_proxy == "on" ]]; then
    autoload -Uz _corp_proxy
    add-zsh-hook preexec _corp_proxy
fi
unset corp_proxy

## Load aliases
local alias_file=${0:h:a}/aliases.zsh
if [[ ! -e ${alias_file}.zwc || ${alias_file}.zwc -ot ${alias_file} ]]; then
    zcompile -Uz ${alias_file}
fi
source ${alias_file}
unset alias_file

## Plugin settings
# ZSH-AUTOSUGGEST
if [[ -d $ZIM_HOME/modules/zsh-autosuggestions ]]; then
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
    ZSH_AUTOSUGGEST_HISTORY_IGNORE=("git *| rsync *| scp *")
    ZSH_AUTOSUGGEST_COMPLETION_IGNORE=("git *| rsync *| scp *")
    ZSH_AUTOSUGGEST_USE_ASYNC="yes"
fi
