# Bind autosuggest-accept to ctrl+space
bindkey '^ ' autosuggest-accept

# Bind up/down to substring search if zsh-substring-search installed
if [[ -d $ZPLUG_REPOS/zsh-users/zsh-history-substring-search ]]; then
	zle -N history-substring-search-up
	zle -N history-substring-search-down
	bindkey '^[[A' history-substring-search-up
	bindkey '^[[B' history-substring-search-down
fi
