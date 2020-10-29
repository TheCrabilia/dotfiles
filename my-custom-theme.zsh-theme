PROMPT='%{$fg[yellow]%}(%m)%{$reset_color%} %~ %{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%}%(!.%{$fg[red]%}.%{$fg[green]%})➤%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
