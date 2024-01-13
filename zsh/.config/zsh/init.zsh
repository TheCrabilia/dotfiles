#!/usr/bin/env zsh

local -a configs=(
    options.zsh
    keybinds.zsh
    hooks.zsh
    prompt.zsh
    completion.zsh
    aliases.zsh
    plugins.zsh
)
for c in $configs; do
    source "${0:h:a}/${c}"
done

# Initialize autoloaded functions
for func in ${0:h:a}/site-functions/^(__*|*.zwc)(N); do
    autoload -Uz "${func}"
done
