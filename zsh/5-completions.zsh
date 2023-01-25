# Add custom completion directory to fpath
unset fpath
completions=(
    /opt/homebrew/share/zsh/site-functions
    /opt/homebrew/share/zsh/functions
    $HOME/.local/share/zsh/site-functions
    $HOME/.zplug/misc/completions
    $HOME/.zplug/base/sources
    $HOME/.zplug/autoload
    $HOME/.zplug/base/utils
    $HOME/.zplug/base/job
    $HOME/.zplug/base/log
    $HOME/.zplug/base/io
    $HOME/.zplug/base/core
    $HOME/.zplug/base/base
    $HOME/.zplug/autoload/commands
    $HOME/.zplug/autoload/options
    $HOME/.zplug/autoload/tags
)
for dir in $completions; do
    fpath+=$dir
done

# Enable completion features
autoload -Uz compinit && compinit
autoload bashcompinit && bashcompinit
zstyle ':complition:*:*:*:*:*' menu select
zstyle ':complition:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # case insensitive tab complition
zstyle ':complition:*' list-colors "${(s.:.)LS_COLORS}" 	# Take advantage of $LS_COLORS for completion as well
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# # kubectl certificate manager completion
if command -v cmctl >/dev/null; then
    cmctl completion zsh > $HOME/.local/share/zsh/site-functions/_cmctl
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
