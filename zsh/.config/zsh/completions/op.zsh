if (( ${+commands[op]} )); then
    _evalcache op completion zsh
    compdef _op op
fi
