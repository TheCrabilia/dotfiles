#!/usr/bin/env bash

if ! which sudo &>/dev/null; then
	echo "Sudo not found! Please install Sudo."
	exit 1
fi

# Debian, etc.
if which apt &>/dev/null; then
	echo "Apt manager found! Installing required staff..."
	sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq zsh python3-pygments vim curl wget < /dev/null > /dev/null
fi

# RHEL, etc.
if which yum &>/dev/null; then
	echo "Yum manager found! Installing required staff..."
	MANAGER=yum
	sudo $MANAGER install -qq epel-release zsh python3-pygments vim curl wget
fi

echo "Installing vim plugin manager..."
curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing vim plugins..."
if which vim &>/dev/null; then
	VIM=vim
elif which nvim &>/dev/null; then
	VIM=nvim
fi

$VIM -c PlugInstall! -c qa!

echo "Copying requered files"
cp ./zshrc $HOME/.zshrc
cp ./zshenv $HOME/.zshenv
cp ./vimrc $HOME/.vimrc

echo "Done!"
