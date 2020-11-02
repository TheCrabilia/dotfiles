#!/bin/bash

if ! which sudo >/dev/null; then
	echo "Sudo not found! Please install Sudo."
	exit 1
fi

# Debian, etc.
if which apt >/dev/null; then
	echo "Apt manager found! Installing required staff..."
	MANAGER=apt
fi

# RHEL, etc.
if which yum >/dev/null; then
	echo "Yum manager found! Installing required staff..."
	MANAGER=yum
	sudo $MANAGER install -yq epel-release
fi

sudo $MANAGER install -yq curl git zsh python3-pygments vim

# Copy required files to user home directory
cp ./zshrc $HOME/.zshrc
cp ./zshenv $HOME/.zshenv

# Change default user shell
sudo usermod --silent -s /bin/zsh $USER

echo "Done!"
