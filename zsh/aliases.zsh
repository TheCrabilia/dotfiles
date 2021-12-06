## System specific aliases
if [[ $OSTYPE = linux* ]]; then
    # Debian
    if command -v apt >/dev/null; then
        alias apt='sudo apt'
    fi

    # Arch Linux
    if command -v pacman >/dev/null; then
        alias pacman='sudo pacman'
    fi

    # RedHat
    if command -v yum >/dev/null; then
        alias yum='sudo yum'
    fi

    if command -v dnf >/dev/null; then
        alias dnf='sudo dnf'
    fi
fi

## Commonly used commands
# Enable colors for ls, grep, diff, ip and man (less)
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

if command -v ip &>/dev/null; then
    alias ip='ip --color=auto'
fi

if command -v systemctl &>/dev/null; then
    alias sctl='sudo systemctl'
fi

alias hn='hostname'
alias md='mkdir -p'

# ls
if command -v exa &>/dev/null; then
    alias ls='exa'
fi
alias la='ls -la'
alias lt='ls -lt'
alias ll='ls -l'
alias l.='ls -ld .?*'

# cd to sub-sub dirs
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# Sudo
if command -v sudo &>/dev/null; then
    alias sudo='nocorrect sudo'
    alias -g '#'='sudo'
    alias -g '##'='sudo !!'
    alias E='sudo -E $EDITOR'
fi

# kubectl aliases
if command -v kubectl &>/dev/null; then
    alias k='kubectl'
    alias ka='kubectl apply'
    alias kd='kubectl delete'
    alias kl='kubectl logs'
    alias kg='kubectl get'
fi

# kubens alias
if command -v kubens &>/dev/null; then
    alias kns='kubens'
fi

# kubectx alias
if command -v kubectx &>/dev/null; then
    alias kctx='kubectx'
fi

# ansible aliases
if command -v ansible &>/dev/null; then
    alias a='ansible'
    alias ap='ansible-playbook'
fi

## Nocorrect aliases
alias mv='nocorrect mv -i'
alias cp='nocorrect cp -i'
alias mkdir='nocorrect mkdir'
alias man='nocorrect man'

## Editor
if [[ -z $EDITOR ]]; then
    alias e=$EDITOR
fi

## Quick access to zshrc
alias zshrc='vim ~/.zshrc'
alias sz='source ~/.zshrc'
