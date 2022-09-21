## System specific aliases
if [[ $OSTYPE == linux* ]]; then
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

# Shadow BSD grep, replace with GNU grep
if command -v ggrep >/dev/null; then
    alias grep='ggrep --color=auto'
    alias egrep='gegrep --color=auto'
    alias fgrep='gfgrep --color=auto'
else
    alias grep='grep --color=auto'
fi

# Shadow BSD findutils, replace with GNU findutils
if command -v gxargs >/dev/null; then
    alias xargs='gxargs'
fi

if command -v gfind >/dev/null; then
    alias find='gfind'
fi

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
    alias la='exa --long --all --git --group'
    alias lt='exa --long --git --group -snew'
    alias ll='exa --long --git --group'
else
    alias la='ls -la'
    alias lt='ls -lt'
    alias ll='ls -l'
    alias l.='ls -ld .?*'
fi

# cat
if command -v bat >/dev/null; then
    alias cat='bat'
fi

# cd to sub-sub dirs
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# Sudo
if command -v sudo &>/dev/null; then
    alias sudo='nocorrect sudo'
    alias -g '#'='sudo'
    alias -g '##'='sudo !!'
fi

# kubectl aliases
if command -v kubectl &>/dev/null; then
    alias k='kubectl'
    alias ka='kubectl apply'
    alias kd='kubectl delete'
    alias kl='kubectl logs'
    alias kg='kubectl get'
fi

if command -v helm &>/dev/null; then
    alias h='helm'
    alias hi='helm install'
    alias hd='helm delete'
    alias hl='helm ls'
    alias hg='helm get'
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

# terraform aliases
if command -v terraform &>/dev/null; then
    alias tf='terraform'
    alias tfa='terraform apply'
    alias tfd='terraform destroy'
fi

# terragrunt aliases
if command -v terragrunt &>/dev/null; then
    alias tg='terragrunt'
    alias tga='terragrunt apply'
    alias tgd='terragrunt destroy'
    alias tgra='terragrunt run-all apply'
    alias tgrd='terragrunt run-all destroy'
fi

## Nocorrect aliases
alias mv='nocorrect mv -i'
alias cp='nocorrect cp -i'
alias mkdir='nocorrect mkdir'
alias man='nocorrect man'

# vim -> nvim if it exists
if command -v nvim >/dev/null; then
    alias vim='nvim'
fi

# Geek-life ToDo manager
if command -v geek-life >/dev/null; then
    alias gl='geek-life'
fi

## Quick access to zshrc
alias zshrc='vim ~/.zshrc'
alias sz='source ~/.zshrc'

