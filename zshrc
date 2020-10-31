export ZSH="/home/ispirts/.oh-my-zsh"
ZSH_THEME="my-custom-theme"
CASE_SENSITIVE="true"
DISABLE_UPDATE_PROMPT="true"
ENABLE_CORRECTION="true"
HIST_STAMPS="dd.mm.yyyy"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-256color docker docker-compose colorize)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HISTORY_IGNORE="git *"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

ZSH_COLORIZE_TOOL=pygmentize
ZSH_COLORIZE_STYLE="native"
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256

function chpwd {
	ls
}

alias exp='explorer.exe .'
alias code='code .'
alias cat='ccat'
alias less='cless'
alias apt='sudo apt'
alias hn='hostname'
alias zshrc='vim ~/.zshrc'
alias szshrc='source ~/.zshrc'
alias sctl='sudo systemctl'
