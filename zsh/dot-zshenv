# disable global RCS files
unsetopt global_rcs

# Prevent double-export in tmux session
if [[ -z $TMUX ]]; then
    # XDG variables
    export XDG_DATA_HOME=$HOME/.local/share
    export XDG_CONFIG_HOME=$HOME/.config
    export XDG_STATE_HOME=$HOME/.local/state
    export XDG_CACHE_HOME=$HOME/.cache

    export HIST_STAMPS="dd.mm.yyyy"
    # Hide EOL sign ('%')
    export PROMPT_EOL_MARK=""

    # Set locale
    export LC_ALL='en_US.UTF-8'
    export SHELL=$(which zsh)

    typeset -aU path
    path=(
        $HOME/.local/bin
        /usr/local/bin
        /opt/homebrew/bin
        /opt/homebrew/sbin
        $HOME/.cargo/bin
        /usr/bin
        /usr/sbin
        /bin
        /sbin
    )

    # Default pager
    (( ${+commands[less]} )) && () {
        export LESS=-r
        export PAGER=less
    }

    # Set default editor
    local -a editors=(
        nvim
        vim
        vi
        nano
    )
    for editor in $editors; do
        (( ${+commands[$editor]} )) && () {
            export EDITOR=$editor
            break
        }
    done
    unset editors
fi

# vim:ft=zsh
