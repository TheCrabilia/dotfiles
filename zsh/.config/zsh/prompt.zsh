setopt prompt_subst

autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:git:*' formats ' (%b)'

prompt_pwd () {
  local p=${${PWD:/~/\~}/#~\//\~/}
  psvar[1]="${(@j[/]M)${(@s[/]M)p##*/}##(.|)?}$p:t"
}

add-zsh-hook precmd vcs_info
add-zsh-hook precmd prompt_pwd

PS1='%F{green}%1v%F{blue}${vcs_info_msg_0_}%F{reset} > '
# RPROMPT='%F{red}%(?..%?)%f'
RPROMPT='%F{red}%(?..%?)%F{reset}'
