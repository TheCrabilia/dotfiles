HIST_STAMPS="dd.mm.yyyy"
# Hide EOL sign ('%')
PROMPT_EOL_MARK=""

# Path
unset path
local -a custom_path_dirs
custom_path_dirs=(
    $HOME/.local/bin
    /usr/local/bin
    /usr/bin
    /usr/sbin
    /bin
    /sbin
    /opt/homebrew/bin
    $HOME/.zplug/bin
)
foreach dir in $custom_path_dirs
    path+=$dir
end

# Colors for ls
# export LSCOLORS="gxFxdxcxCxegedabagacad"
# export LS_COLORS="di=36:ln=1;35:so=33:pi=32:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
export CLICOLOR=1

# Configure locale on darwin
if [[ $OSTYPE == darwin* ]]; then
    export LC_ALL='en_US.UTF-8'
fi

# Enable colors in less and man commands
export LESS_TERMCAP_mb=$'\E[1;31m'	    # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'	    # begin bold
export LESS_TERMCAP_me=$'\E[0m'	        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;33m'	    # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'	        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'	    # begin underline
export LESS_TERMCAP_ue=$'\E[0m'	        # reset underline

# Fix broken terminals
export SHELL=$(which zsh)

# Default pager
if which less >/dev/null; then
    export LESS=-r
    export PAGER=less
fi

# Set default editor
local -a editors
editors=(
    nvim
    vim
    vi
    nano
)

foreach editor in $editors
    if which $editor >/dev/null; then
	export EDITOR=$editor
	break
    fi
end

# Init zoxide if exists
if command -v zoxide >/dev/null; then
    eval "$(zoxide init --cmd cd zsh)"
fi
