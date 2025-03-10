setopt prompt_subst

autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:git:*' formats ' (%b)'
zstyle ':vcs_info:git:*' actionformats ' (%b|%a)'

add-zsh-hook precmd vcs_info

PS1='%F{green}%c%F{blue}${vcs_info_msg_0_}%F{reset} > '
# RPROMPT='%F{red}%(?..%?)%f'
RPROMPT='%F{red}%(?..%?)%F{reset}'
