setopt prompt_subst

autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:git:*' formats ' %b '

_vcs_info () {
    buildin cd -q $1
    vcs_info
    print $vcs_info_msg_0_
}

_vcs_info_done () {
    local stdout=$3
    vcs_info_msg_0_=$stdout
    zle reset-prompt
}

async_start_worker vcs_info
async_register_callback vcs_info _vcs_info_done

_vcs_info_precmd () {
    async_flush_jobs vcs_info
    async_job vcs_info _vcs_info $PWD
}
add-zsh-hook precmd _vcs_info_precmd

# Colors
GRAY=244
GREEN=28
MAGENTA=126
RED=124
YELLOW=214
BLUE=69

# Prompt variables
PROMPT=$'%F{$GRAY}[%f%F{$YELLOW}%0~%f%F{$GRAY}]%f %F{$BLUE}${vcs_info_msg_0_}%f%F{$GRAY}>%f '
RPROMPT=$'%F{$RED}%(?..%?)%f'
