# Allow variable substitution inside prompts
setopt prompt_subst

# Draw hostname if it is ssh connection
[[ -c $SSH_TTY ]] && hn='%m '

# Red prompt if root
local user_color='%F{green}'; [ $UID -eq 0 ] && user_color='%F{red}'

ZSH_THEME_GIT_PROMPT_PREFIX=' | '
#ZSH_THEME_GIT_PROMPT_SUFFIX=''
ZSH_THEME_GIT_PROMPT_CLEAN=' %F{red}%F{green}+%f'
ZSH_THEME_GIT_PROMPT_DIRTY=' %F{red}-%f'

# Prompt variables
PROMPT='%F{red}[%F{green}$hn%f%~%F{red}%f$(git_prompt_info)%F{blue}%F{red}]%f$user_color#%f '

