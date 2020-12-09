## System specific aliases
# WSL 2
if [[ $TERM = xterm-256color ]]; then
	alias exp='explorer.exe .'
	alias code='code .'
fi

# Debian
if command -v apt >/dev/null; then
	alias apt='sudo apt'
fi

# RedHat
if command -v yum >/dev/null; then
	alias yum='sudo yum'
fi

## Commonly used commands
#alias cat='ccat'
#alias less='cless'
alias hn='hostname'
alias sctl='sudo systemctl'
alias md='mkdir -p'

# ls
alias ls='ls --color=auto'
alias la='ls -la'
alias lt='ls -lat'
alias ll='ls -l'

# grep
alias grep='grep --color=auto'

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
