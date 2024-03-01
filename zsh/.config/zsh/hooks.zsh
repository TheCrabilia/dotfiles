autoload -Uz add-zsh-hook

_autols () {
    emulate -L zsh
    (( ${+commands[exa]} )) && exa || ls
}
add-zsh-hook chpwd _autols
