# Enable completion features
autoload -Uz compinit && compinit
autoload bashcompinit && bashcompinit
zstyle ':complition:*:*:*:*:*' menu select
zstyle ':complition:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # case insensitive tab complition
zstyle ':complition:*' list-colors "${(s.:.)LS_COLORS}" 	# Take advantage of $LS_COLORS for completion as well

# Add custom completion directory to fpath
fpath=($HOME/.zsh/completion $fpath)

# kubectl completion
if command -v kubectl >/dev/null; then
    eval "$(kubectl completion zsh)"
fi

# aws cli completion
if command -v aws >/dev/null; then
    complete -C $(which aws_completer) aws
fi

# helm completion
if command -v helm >/dev/null; then
    eval "$(helm completion zsh)"
fi

# minikube completion
if command -v minikube >/dev/null; then
    eval "$(minikube completion zsh)"
fi

# tekton-cli completion
if command -v tkn >/dev/null; then
    eval "$(tkn completion zsh)"
fi

# terraform completion
if command -v terraform >/dev/null; then
    complete -o nospace -C $(which terraform) terraform
fi
