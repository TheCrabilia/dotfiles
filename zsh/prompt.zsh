# Allow variable substitution inside prompts
setopt prompt_subst

# Draw different symbols depending on terminal
if [ $TERM = xterm-256color ]; then
	prompt_hello="➤"
	git_symbol_dirty=" ✗"
        git_symbol_clean=" ✔"
else
	prompt_hello=">"
	git_symbol_dirty=" -"
        git_symbol_clean=" +"
fi

# Draw user@hostname if it is ssh connection
if [[ -c $SSH_TTY ]]; then
	ssh_conn='%F{yellow}%n@%m%f '
fi

# Red prompt if root
local user_color="%F{red}%F{green}"; [ $UID -eq 0 ] && user_color="%F{red}"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{blue}(%f"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{blue})%f "
ZSH_THEME_GIT_PROMPT_CLEAN="%F{red}%F{green}$git_symbol_clean%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}$git_symbol_dirty%f"

# Prompt variables
PROMPT='$ssh_conn$(git_prompt_info)%f$user_color$prompt_hello%f '
RPROMPT='%~ %F{red}%?%f %F{yellow}[%T]%f'
