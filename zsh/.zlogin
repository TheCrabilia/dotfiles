#!/usr/bin/env zsh

(
    autoload -Uz zrecompile
    zcompdump="${XDG_CACHE_HOME}/zsh/zcompdump"
    if [[ -s "${zcompdump}" && (! -s "${zcompdump}.zwc" || "${zcompdump}" -nt "${zcompdump}.zwc") ]]; then
        zrecompile -pq "${zcompdump}"
    fi
) &!
