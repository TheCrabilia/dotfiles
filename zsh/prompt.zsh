# Allow variable substitution inside prompts
setopt prompt_subst
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats '%F{214}%b%f'

# Draw hostname if it is ssh connection
local hostname=''
[[ -c $SSH_TTY ]] && hostname='%m@'

# Prompt variables
PROMPT=$'%F{33}%3~%f%F{cyan}${exec_time}%f
%F{magenta}>%f '
RPROMPT=$'%F{red}%(?..%?)%f $vcs_info_msg_0_'
