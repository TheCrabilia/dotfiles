local zplug_home=$HOME/.zplug
if [[ -d $zplug_home ]]; then
	oh_my_zsh_plugins=(
		git
		docker
		docker-compose
		colorize
	)

	plugins=(
		chrissicool/zsh-256color
		zsh-users/zsh-autosuggestions
		zsh-users/zsh-history-substring-search
		zsh-users/zsh-syntax-highlighting
	)

	source $zplug_home/init.zsh
	foreach plugin in $oh_my_zsh_plugins
		zplug "plugins/$plugin", from:oh-my-zsh
	end
	foreach plugin in $plugins
		zplug "$plugin"
	end

	# Install plugins if there are plugins that are not been installed
	if ! zplug check --verbose; then
		printf "Install? [y/N]: "
		if read -q; then
			echo; zplug install
		fi
	fi

	# Load zplug
	zplug load

	# Bind up/down to substring search if zsh-substring-search installed
	if [[ -d $ZPLUG_REPOS/zsh-users/zsh-history-substring-search ]]; then
		zle -N history-substring-search-up
		zle -N history-substring-search-down
		bindkey '^[[A' history-substring-search-up
		bindkey '^[[B' history-substring-search-down
	fi
else
	# Install zplug if it is not already installed
	git clone -q https://github.com/zplug/zplug $zplug_home
fi

## Plugins settings
# ZSH-AUTOSUGGEST
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HISTORY_IGNORE=("git *| rsync *| scp *")
ZSH_AUTOSUGGEST_COMPLETION_IGNORE=("git *| rsync *| scp *")
ZSH_AUTOSUGGEST_USE_ASYNC="yes"

# ZSH-SYNTAX-HIGHLIGHT
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# ZSH-COLORIZE
ZSH_COLORIZE_TOOL=pygmentize
ZSH_COLORIZE_STYLE="native"
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256
