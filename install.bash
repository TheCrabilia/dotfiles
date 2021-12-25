#!/usr/bin/env bash

# Colors
RED='\e[1;31m%-6s\e[m'
GREEN='\e[1;32m%-6s\e[m'

[[ $(whoami) != root ]] && { printf "$RED\n" "Please, run this script as root!"; exit -1; }

if ! command -v curl >/dev/null; then
    printf "$RED\n" "Curl is not installed. Please, install and try again..."
    exit -1
fi

if ! command -v nvim >/dev/null && ! command -v vim >/dev/null; then
    printf "$RED\n" "Neovim nor vim are not installed. Please, install and try again..."
    exit -1
fi

PWD=$(pwd)

printf $GREEN "[INFO] "
printf "Installing vim plugin manager\n"
if command -v nvim >/dev/null; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
elif command -v vim >/dev/null; then
    curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [[ ! -d $HOME/.config/nvim ]]; then
    printf $GREEN "[INFO] "
    printf "Creating vim config directory and copying config\n"
    mkdir -p $HOME/.config/nvim
    ln -s $PWD/nvim/init.vim $HOME/.config/nvim/init.vim
fi

printf $GREEN "[INFO] "
printf "Installing vim plugins\n"
nvim -c PlugInstall -c qa!

printf $GREEN "[INFO] "
printf "Creating symlinks\n"
for file in $(ls $PWD/dotfiles); do
    ln -s $PWD/dotfiles/$file $HOME/.$file
done

ZSH_CONFIG_SRC=$PWD/zsh
ZSH_CONFIG_DST=$HOME/.config/zsh
if [[ ! -d $ZSH_CONFIG_DST ]]; then
    mkdir -p $ZSH_CONFIG_DST
    for file in $(ls $ZSH_CONFIG_SRC); do
        ln -s $ZSH_CONFIG_SRC/$file $ZSH_CONFIG_DST/$file
    done
fi

printf $GREEN "[INFO] "
printf "Done\n"
