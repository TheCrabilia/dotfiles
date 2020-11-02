HIST_STAMPS="dd.mm.yyyy"

# Colors for ls
export LSCOLORS="exgxcxcxbxegedabagacad"
export LS_COLORS="di=34:ln=36:so=32:pi=32:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
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
