_get_welcome_prompt() {
	if [ $TERM = xterm-256color ]; then
		echo "➤"
	else
		echo "$"
	fi
}

PROMPT='%{$fg[yellow]%}(%m)%{$reset_color%} %~ %{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%}%(!.%{$fg[red]%}.%{$fg[green]%})$(_get_welcome_prompt)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
