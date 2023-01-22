# Add custom completion directory to fpath
fpath=(/opt/homebrew/share/zsh/site-functions $HOME/.zsh/completion $fpath)

# Enable completion features
autoload -Uz compinit && compinit
autoload bashcompinit && bashcompinit
zstyle ':complition:*:*:*:*:*' menu select
zstyle ':complition:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # case insensitive tab complition
zstyle ':complition:*' list-colors "${(s.:.)LS_COLORS}" 	# Take advantage of $LS_COLORS for completion as well
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# kubectl certificate manager completion
if command -v cmctl >/dev/null; then
    cmctl completion zsh > $fpath[2]/_cmctl
fi

# minikube completion
if command -v kind >/dev/null; then
    eval "$(kind completion zsh)"
fi

# terraform completion
if command -v terraform >/dev/null; then
    complete -o nospace -C $(which terraform) terraform
fi

# 1passowrd-cli completion
if command -v op >/dev/null; then
    eval "$(op completion zsh)"
    compdef _op op
fi
