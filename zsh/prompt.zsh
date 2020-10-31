# allow variable substitution inside prompts
setopt prompt_subst

# draw different prompt hello depending on terminal
if [ $TERM = xterm-256color ]; then
	prompt_hello="➤"
else
	prompt_hello="$"
fi

# draw user@hostname if it is ssh connection
if [[ -c $SSH_TTY ]]; then
	ssh_conn='%F{yellow}%n@%m%f '
fi

# red prompt if root
local user_color="%(!.%{$fg[red]%}.%{$fg[green]%})"; [ $UID -eq 0 ] && user_color="%F{red}"

# different git symbol depending on terminal
if [ $TERM = xterm-256color ]; then
	git_symbol_dirty="✗"
	git_symbol_clean="✔"
else
	git_symbol_dirty="-"
	git_symbol_clean="+"
fi

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
ZSH_THEME_GIT_PROMPT_DIRTY=" %f%F{red}$git_symbol_dirty%f"
ZSH_THEME_GIT_PROMPT_CLEAN=" %f%F{green}$git_symbol_clean%f"

PROMPT='$ssh_conn$(git_prompt_info)$user_color$prompt_hello%f '
RPROMPT='%~ %F{red}%?%f %F{yellow}[%T]%f'
