## Load plugins
# Load zinit if available
local zinit=~/.zinit/bin/zinit.zsh
if [[ -f $zinit ]]; then
	omz_plugins=(
		git
		#docker
		docker-compose
		colorize
	)

	zsh_plugins=(
		chrissicool/zsh-256color
		zsh-users/zsh-autosuggestions
		zsh-users/zsh-history-substring-search
		zsh-users/zsh-syntax-highlighting
	)

	source $zinit
	# Install Oh-My-Zsh plugins
	foreach plugin in $omz_plugins
		zinit snippet OMZP::$plugin
	end
	# Install custom plugins
	foreach plugin in $zsh_plugins
		zinit light $plugin
	end
fi

## Install plugin installers and some other staff :)
function install_zinit {
	mkdir ~/.zinit
	git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
}

function update_zsh_plugins {
	zinit update --all
}

## Plugins settings
# ZSH-AUTOSUGGEST
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HISTORY_IGNORE="git *"

# ZSH-SYNTAX-HIGHLIGHT
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# ZSH-COLORIZE
ZSH_COLORIZE_TOOL=pygmentize
ZSH_COLORIZE_STYLE="native"
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256
