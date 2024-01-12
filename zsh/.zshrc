#!/usr/bin/env zsh

# zmodload zsh/zprof

## Plugin manager
ZIM_HOME=$XDG_DATA_HOME/zim

# Download zimfw plugin manager if missing
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
    source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize modules
source ${ZIM_HOME}/init.zsh

## Load additional configuration files
source ${XDG_CONFIG_HOME}/zsh/init.zsh
