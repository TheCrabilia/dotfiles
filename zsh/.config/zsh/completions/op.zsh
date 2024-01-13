if builtin command -v op &>/dev/null; then
    _evalcache op completion zsh
    compdef _op op
fi
