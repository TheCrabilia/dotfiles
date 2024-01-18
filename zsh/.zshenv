#!/usr/bin/env zsh

# disable global RCS files
unsetopt global_rcs

# XDG variables
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export HIST_STAMPS="dd.mm.yyyy"
export HISTFILE=$XDG_CACHE_HOME/zsh/zsh_history
export HISTSIZE=20000
export SAVEHIST=10000

# Hide EOL sign ('%')
export PROMPT_EOL_MARK=""

# Set locale
export LC_ALL='en_US.UTF-8'
