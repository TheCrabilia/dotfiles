# Bind autosuggest-accept to ctrl+space
bindkey '^ ' autosuggest-accept

# Bind up/down to substring search if zsh-substring-search installed
if [[ -d $ZIM_HOME/modules/zsh-history-substring-search ]]; then
    zle -N history-substring-search-up
    zle -N history-substring-search-down
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
    bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down
fi

bindkey '^A' beginning-of-line			    # ctrl + A
bindkey '^E' end-of-line			    # ctrl + E
bindkey '^R' history-incremental-search-backward    # ctrl + R