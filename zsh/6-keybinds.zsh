# Bind autosuggest-accept to ctrl+space
bindkey '^ ' autosuggest-accept

# Bind up/down to substring search if zsh-substring-search installed
if [[ -d $ZPLUG_REPOS/zsh-users/zsh-history-substring-search ]]; then
    zle -N history-substring-search-up
    zle -N history-substring-search-down
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
    bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down
fi

bindkey '\eOH' beginning-of-line		    # Home
bindkey '\e[H' beginning-of-line		    # Home (xorg)
bindkey '\e[1~' beginning-of-line		    # Home (console)
bindkey '^A' beginning-of-line			    # ctrl + A
bindkey '\eOF' end-of-line			    # End
bindkey '\e[F' end-of-line			    # End (xorg)
bindkey '\e[4~' end-of-line			    # End (console)
bindkey '^E' end-of-line			    # ctrl + E
bindkey '\e[2~' overwrite-mode			    # Ins
bindkey '\e[3~' delete-char			    # Del
if [[ $OSTYPE = darwin* ]]; then
    bindkey '\e\e[C' forward-word		    # Opt + ->
    bindkey '\e\e[D' backward-word		    # Opt + <-
else
    bindkey '^[[1;5C' forward-word		    # ctrl + ->
    bindkey '^[[1;5D' backward-word		    # ctrl + <-
fi
bindkey '^[[Z' undo				    # shift + tab undo las action
bindkey '^R' history-incremental-search-backward    # ctrl + R
