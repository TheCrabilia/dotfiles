## System specific aliases
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

## Enable color support of ls, grep, diff, ip and man (less)
if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

    export LESS_TERMCAP_mb=$'\E[1;31m'	    # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'	    # begin bold
    export LESS_TERMCAP_me=$'\E[0m'	    # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'	    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'	    # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'	    # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'	    # reset underline

    # Take advantage of $LS_COLORSfor completion as well
    zstyle ':complition:*' list-colors "${(s.:.)LS_COLORS}"
fi

# Replace cat with batcat if it exists
if command -v batcat &>/dev/null; then
    alias cat='batcat'
fi

## Commonly used commands
# alias cat='ccat'
# alias less='cless'
alias hn='hostname'
alias sctl='sudo systemctl'
alias md='mkdir -p'

# ls
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
fi

# kubens aliases
if command -v kubens &>/dev/null; then
    alias kns='kubens'
fi

# kubectx aliases
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
alias szshrc='source ~/.zshrc'
