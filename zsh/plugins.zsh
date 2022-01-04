zplug_home=$HOME/.zplug

# Check if zplug is installed
if [[ ! -d $zplug_home ]]; then
    git clone https://github.com/zplug/zplug $zplug_home
    source $zplug_home/init.zsh
fi

source $zplug_home/init.zsh

# Pluging
zplug "chrissicool/zsh-256color"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "stedolan/jq", from:gh-r, as:command

# Install plugins if there are plugins that are not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

# Load plugins
zplug load

## Plugins settings
# ZSH-AUTOSUGGEST
if [[ -d $HOME/.zplug/repos/zsh-users/zsh-autosuggestions ]]; then
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
    ZSH_AUTOSUGGEST_HISTORY_IGNORE=("git *| rsync *| scp *")
    ZSH_AUTOSUGGEST_COMPLETION_IGNORE=("git *| rsync *| scp *")
    ZSH_AUTOSUGGEST_USE_ASYNC="yes"
fi

if [[ -d $HOME/.zplug/repos/zsh-users/zsh-syntax-highlighting ]]; then
    ZSH_HIGHLIGHT_STYLES[globbing]=fg=magenta
fi
