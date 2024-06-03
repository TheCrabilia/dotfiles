[[ ${TERM} != dumb ]] && () {
    zmodload -F zsh/terminfo +b:echoti +p:terminfo
    typeset -gA key_info
    key_info=(
        Control         '\C-'
        ControlLeft     '\e[1;5D \e[5D \e\e[D \e0d \e0D'
        ControlRight    '\e[1;5C \e[5C \e\e[C \e0c \e0C'
        Escape          '\e'
        Meta            '\M-'
        Backspace       '^?'
        Delete          '^[[3~'
        BackTab         "${terminfo[kcbt]}"
        Left            "${terminfo[kcub1]}"
        Down            "${terminfo[kcud1]}"
        Right           "${terminfo[kcuf1]}"
        Up              "${terminfo[kcuu1]}"
        End             "${terminfo[kend]}"
        F1              "${terminfo[kf1]}"
        F2              "${terminfo[kf2]}"
        F3              "${terminfo[kf3]}"
        F4              "${terminfo[kf4]}"
        F5              "${terminfo[kf5]}"
        F6              "${terminfo[kf6]}"
        F7              "${terminfo[kf7]}"
        F8              "${terminfo[kf8]}"
        F9              "${terminfo[kf9]}"
        F10             "${terminfo[kf10]}"
        F11             "${terminfo[kf11]}"
        F12             "${terminfo[kf12]}"
        Home            "${terminfo[khome]}"
        Insert          "${terminfo[kich1]}"
        PageDown        "${terminfo[knp]}"
        PageUp          "${terminfo[kpp]}"
    )

    ## Common bindings

    bindkey ${key_info[Backspace]} backward-delete-char
    bindkey ${key_info[Delete]} delete-key

    bindkey "${key_info[Control]}A" beginning-of-line
    bindkey "${key_info[Control]}E" end-of-line
    bindkey "${key_info[Control]}B" backward-word
    bindkey "${key_info[Control]}F" forward-word
    bindkey "${key_info[Control]}R" history-incremental-search-backward

    autoload -Uz edit-command-line && zle -N edit-command-line && \
        bindkey "${key_info[Control]}x${key_info[Control]}e" edit-command-line

    if [[ -n ${key_info[BackTab]} ]] bindkey ${key_info[BackTab]} reverse-menu-complete

    autoload -Uz bracketed-paste-url-magic && zle -N bracketed-paste bracketed-paste-url-magic
    autoload -Uz url-quote-magic && zle -N self-insert url-quote-magic

    if [[ $OSTYPE =~ "darwin" ]]; then
        bindkey -s '^[`' '`' # fix Option+` binding
    fi

    ## Plugin bindgins
    bindkey '^ ' autosuggest-accept
    bindkey ' ' abbr-expand-and-insert
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
    bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down
}
