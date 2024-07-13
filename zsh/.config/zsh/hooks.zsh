autoload -Uz add-zsh-hook

_autols () {
    emulate -L zsh
    (( ${+commands[eza]} )) && eza || ls
}
add-zsh-hook chpwd _autols
