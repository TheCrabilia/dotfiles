# Allow variable substitution inside prompts
setopt prompt_subst

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats '%b:'

# Colors
GRAY=244
GREEN=2
MAGENTA=126
RED=124
YELLOW=214

# Prompt variables
PROMPT=$'%F{$GRAY}%m%f %F{$YELLOW}[%f${AWS_PROFILE_PROMPT}%F{$MAGENTA}${vcs_info_msg_0_}%f%F{$GREEN}%1~%f%F{$YELLOW}]%f %F{$GRAY}>%f '
RPROMPT=$'%F{$RED}%(?..%?)%f'
