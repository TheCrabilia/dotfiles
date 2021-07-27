#!/usr/bin/env bash

if ! which sudo &>/dev/null; then
	echo "Sudo not found! Please install Sudo."
	exit 1
fi

# Debian, etc.
if which apt &>/dev/null; then
	echo "Apt manager found! Installing required staff..."
	OS=debian
	sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq zsh python3-pygments vim curl wget gawk < /dev/null > /dev/null
fi

# RHEL, etc.
if which dnf &>/dev/null; then
	echo "Dnf manager found! Installing required staff..."
	OS=rhel
	MANAGER=dnf
	sudo $MANAGER install -qq epel-release zsh python3-pygments vim curl wget
fi

echo "Installing vim plugin manager..."
curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing vim plugins..."
vim -c PlugInstall! -c qa!

echo "Copying requered files"
cp ./zshrc $HOME/.zshrc
cp ./zshenv $HOME/.zshenv
cp ./vimrc $HOME/.vimrc
if [[ $OS = debian ]]; then
    cp ./tmux $HOME/.tmux.conf
elif [[ $OS = rhel ]]; then
    cp ./tmux_old $HOME/.tmux.conf
fi

echo "Done!"
