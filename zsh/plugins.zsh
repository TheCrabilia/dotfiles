local zplug_home=$HOME/.zplug

# Check if zplug is installed
if [[ ! -d $zplug_home ]]; then
    git clone https://github.com/zplug/zplug $zplug_home
    source $zplug_home/init.zsh
fi

source $zplug_home/init.zsh

# Pluging
zplug "chrissicool/zsh-256color"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "stedolan/jq", from:gh-r, as:command

# Install plugins if there are plugins that are not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

# Load plugins
zplug load

# Bind up/down to substring search if zsh-substring-search installed
if [[ -d $ZPLUG_REPOS/zsh-users/zsh-history-substring-search ]]; then
    zle -N history-substring-search-up
    zle -N history-substring-search-down
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
fi

zmodload zsh/zprof

## Plugins settings
# ZSH-AUTOSUGGEST
if [ -d $HOME/.zplug/repos/zsh-users/zsh-autosuggestions ]; then
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
    ZSH_AUTOSUGGEST_HISTORY_IGNORE=("git *| rsync *| scp *")
    ZSH_AUTOSUGGEST_COMPLETION_IGNORE=("git *| rsync *| scp *")
    ZSH_AUTOSUGGEST_USE_ASYNC="yes"
fi

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
    source <(kubectl completion zsh)
    complete -F __start_kubectl k
fi

# aws cli completion
if command -v aws >/dev/null; then
    complete -C $(which aws_completer) aws
fi

# helm completion
if command -v helm >/dev/null; then
    helm completion zsh > "${fpath[1]}/_helm"
fi

# minikube completion
if command -v minikube >/dev/null; then
    eval "$(minikube completion zsh)"
fi

# tekton-cli completion
if command -v tkn >/dev/null; then
    tkn completion zsh > "${fpath[1]}/_tkn"
fi

# terraform completion
if command -v terraform >/dev/null; then
    complete -o nospace -C $(which terraform) terraform
fi
