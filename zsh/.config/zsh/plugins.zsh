# ZSH-AUTOSUGGEST
if [[ -d $ZIM_HOME/modules/zsh-autosuggestions ]]; then
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
    ZSH_AUTOSUGGEST_HISTORY_IGNORE=("git *| rsync *| scp *")
    ZSH_AUTOSUGGEST_COMPLETION_IGNORE=("git *| rsync *| scp *")
    ZSH_AUTOSUGGEST_USE_ASYNC="yes"
fi

# Extra tools
local fzf_dir="/opt/homebrew/opt/fzf"
if [[ -f "${fzf_dir}/shell/completion.zsh" && -f "${fzf_dir}/shell/key-bindings.zsh" ]]; then
    source "${fzf_dir}/shell/completion.zsh"
    source "${fzf_dir}/shell/key-bindings.zsh"
fi
unset fzf_dir

_evalcache zoxide init zsh --cmd cd
eval "$(mise activate zsh)" # do not use evalcache for mise, because it messes up PATH in new terminal windows
