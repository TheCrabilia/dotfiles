HIST_STAMPS="dd.mm.yyyy"
# Hide EOL sign ('%')
PROMPT_EOL_MARK=""

# Path
path+=$HOME/.local/bin

# Colors for ls
export LSCOLORS="gxFxdxcxCxegedabagacad"
export LS_COLORS="di=36:ln=1;35:so=33:pi=32:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
export CLICOLOR=1

# Fix broken terminals
export SHELL=$(which zsh)

# OS specific environment settings
case $OSTYPE in
    linux*)
	export HOSTNAME=$(hostname -s)
	;;
esac

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
)

foreach editor in $editors
    if which $editor >/dev/null; then
	export EDITOR=$editor
	break
    fi
end

# Load SSH keys to keychain
if [[ -f /usr/bin/keychain ]]; then
    /usr/bin/keychain -q --nogui $HOME/.ssh/id_rsa
    source $HOME/.keychain/$HOST-sh
fi
