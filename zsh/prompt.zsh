# Allow variable substitution inside prompts
setopt prompt_subst

# Draw hostname if it is ssh connection
[[ -c $SSH_TTY ]] && hn='%m '

# Red prompt if root
local hn_color='%F{green}'; [ $UID -eq 0 ] && hn_color=''

ZSH_THEME_GIT_PROMPT_PREFIX=' | '
#ZSH_THEME_GIT_PROMPT_SUFFIX=''
ZSH_THEME_GIT_PROMPT_CLEAN=' %F{red}%F{green}+%f'
ZSH_THEME_GIT_PROMPT_DIRTY=' %F{red}-%f'

# Prompt variables
PROMPT='%F{red}[$hn_color$hn%f%~%F{red}%f$(git_prompt_info)%F{blue}%F{red}]#%f '

