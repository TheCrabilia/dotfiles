# Allow variable substitution inside prompts
setopt prompt_subst
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats '%F{green}(%b)%f'

# Draw hostname if it is ssh connection
local host=''
[[ -c $SSH_TTY ]] && host='%m '

#ZSH_THEME_GIT_PROMPT_PREFIX='('
#ZSH_THEME_GIT_PROMPT_SUFFIX=')'
#ZSH_THEME_GIT_PROMPT_CLEAN=' %F{red}%F{green}+%f'
#ZSH_THEME_GIT_PROMPT_DIRTY=' %F{red}-%f'

# Prompt variables
PROMPT='%F{red}[%F{green}%(!.%m .$host)%f%1~%F{blue}%F{red}]%f%(!.%F{red}#%f.%F{green}#%f) '
RPROMPT='%F{red}%(?..%?)%f $vcs_info_msg_0_'
