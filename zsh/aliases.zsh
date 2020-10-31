## System specific aliases
# WSL 2
if [ $TERM = xterm-256color ]; then
	alias exp='explorer.exe .'
	alias code='code .'
fi

# Debian
if [ $(command -v apt >/dev/null) ]; then
	alias apt='sudo apt'
fi

# RedHat
if [ $(command -v yum >/dev/null) ]; then
	alias yum='sudo yum'
fi

## Commonly used commands
alias cat='ccat'
alias less='cless'
alias hn='hostname'
alias sctl='sudo systemctl'

## Quick access to zshrc
alias zshrc='vim ~/.zshrc'
alias szshrc='source ~/.zshrc'
