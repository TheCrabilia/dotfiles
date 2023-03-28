# Add custom completion directory to fpath
unset fpath
local -a completions
completions=(
    /opt/homebrew/share/zsh/site-functions
    /opt/homebrew/share/zsh/functions
    $HOME/.local/share/zsh/site-functions
    $ZSH_CONFIG_DIR/functions
)
for dir in $completions; do
    fpath+=$dir
done
unset completions

# Enable completion features
autoload -Uz compinit && compinit
autoload bashcompinit && bashcompinit
zstyle ':complition:*:*:*:*:*' menu select
zstyle ':complition:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # case insensitive tab complition
zstyle ':complition:*' list-colors "${(s.:.)LS_COLORS}" 	# Take advantage of $LS_COLORS for completion as well
# zstyle ':completion:*:*:docker:*' option-stacking yes
# zstyle ':completion:*:*:docker-*:*' option-stacking yes

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

# colima completion
if command -v colima &>/dev/null; then
    eval "$(colima completion zsh)"
    compdef _colima colima
fi

# styra cli completion
if command -v styra &>/dev/null; then
    eval "$(styra completion zsh)"
    compdef _styra styra
fi

# mdbook completion
if command -v mdbook &>/dev/null; then
    mdbook completions zsh > $HOME/.local/share/zsh/site-functions/_mdbook
fi
