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
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)
    typeset -gA ZSH_HIGHLIGHT_STYLES

    ## Comments
    ZSH_HIGHLIGHT_STYLES[comment]='fg=#264653'
    ## Constants
    ## Functions
    ZSH_HIGHLIGHT_STYLES[alias]='fg=#2a9d8f' # changed
    ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#2a9d8f' # changed
    ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#2a9d8f' # changed
    ZSH_HIGHLIGHT_STYLES[function]='fg=#2a9d8f' # changed
    ZSH_HIGHLIGHT_STYLES[command]='fg=#2a9d8f' # changed
    ZSH_HIGHLIGHT_STYLES[precommand]='fg=#e9c46a,italic' # changed
    ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#f4a261,italic' # changed
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#f4a261' # changed
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#f4a261' # changed
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#f4a261' # changed
    ## Keywords
    ## Builtins
    ZSH_HIGHLIGHT_STYLES[builtin]='fg=#2a9d8f' # changed
    ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#2a9d8f' # changed
    ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#2a9d8f' # changed
    ## Punctuation
    ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#e76f51' # changed
    ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#e76f51' # changed
    ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#e76f51' # changed
    ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#e76f51' # changed
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#e76f51' # changed
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#e76f51' # changed
    ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#e76f51' # changed
    ## Serializable / Configuration Languages
    ## Storage
    ## Strings
    ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#e76f51' # changed
    ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#e76f51' # changed
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#e9c46a' # changed
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#ea999c'
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#e9c46a' # changed
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#ea999c'
    ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#e5c890'
    ## Variables
    ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#e9c46a' # changed
    ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#ea999c'
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#e9c46a' # changed
    ZSH_HIGHLIGHT_STYLES[assign]='fg=#e76f51' # changed
    ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#e76f51' # changed
    ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#e76f51' # changed
    ## No category relevant in spec
    ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#d62828' # changed
    ZSH_HIGHLIGHT_STYLES[path]='fg=#e9c46a,underline' # changed
    ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#e9c46a,underline' # changed
    ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#e9c46a,underline' # changed
    ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#e76f51,underline' # changed
    ZSH_HIGHLIGHT_STYLES[globbing]='fg=#e76f51' # changed
    ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#f4a261' # changed
    #ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
    #ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
    #ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
    ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=#e9c46a' # changed
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#ea999c'
    ZSH_HIGHLIGHT_STYLES[redirection]='fg=#e76f51' # changed
    ZSH_HIGHLIGHT_STYLES[arg0]='fg=#c7c7c7' # changed
    ZSH_HIGHLIGHT_STYLES[default]='fg=#c7c7c7' # changed
fi

# Load plugins
zplug load
