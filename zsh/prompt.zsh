# Allow variable substitution inside prompts
setopt prompt_subst
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats '%F{214}(%b)%f'

# Draw hostname if it is ssh connection
local hostname=''
[[ -c $SSH_TTY ]] && hostname='%m@'

# Prompt variables
#PROMPT=$'%F{214}(%f%F{125}%n@%m%f%F{214})-[%f%2~%F{214}]%f%F{125}%(!.#.$)%f '
PROMPT=$'%F{red}[%F{green}%n@%m%f %1~%F{red}]%F{green}%(!.#.$)%f '
RPROMPT=$'%F{red}%(?..%?)%f $vcs_info_msg_0_'
