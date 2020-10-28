#!/bin/bash

if [ ! $(command -v sudo) ]; then
	echo "Sudo not found! Please install Sudo."
	exit 1
fi

if [ $(command -v apt) ]; then
	echo "Apt manager found!"
	MANAGER="apt"
fi

if [ $(command -v yum) ]; then
	echo "Yum manager found!"
	MANAGER="yum"
fi

sudo $MANAGER update -y
sudo $MANAGER install -y zsh chroma

cp ./zshrc $HOME/.zshrc
cp -r ./oh-my-zsh $HOME/.oh-my-zsh

chsh -s $(which zsh)
source $HOME/.zshrc
