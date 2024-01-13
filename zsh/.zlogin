#!/usr/bin/env zsh

(
    autoload -Uz zrecompile

    zcompdump="${XDG_CACHE_HOME}/zsh/zcompdump"
    if [[ -s "${zcompdump}" && (! -s "${zcompdump}.zwc" || "${zcompdump}" -nt "${zcompdump}.zwc") ]]; then
        zrecompile -pq "${zcompdump}"
    fi

    local -a compile=(
        ${HOME}/.zshenv
        ${HOME}/.zprofile
        ${HOME}/.zshrc
        ${HOME}/.zimrc
        ${XDG_CONFIG_HOME}/zsh/^(*.zwc)(N)
        ${XDG_CONFIG_HOME}/zsh/site-functions/^(*.zwc)(N)
        ${XDG_CONFIG_HOME}/zsh/completions/^(*.zwc)(N)
    )
    for f in $compile; do
        [[ -f "${f}.zwc.old" ]] && rm -f "${f}.zwc.old"
        [[ ! -d "${f}" && (! -e "${f}.zwc" || "${f}.zwc" -ot "${f}") ]] && zrecompile -pq "${f}"
    done
) &!
