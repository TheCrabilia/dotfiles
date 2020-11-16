#!/usr/bin/env bash

echo "Updating..."

if [[ -d ~/.vim ]]; then
	rm -rf ~/.vim
fi

if [[ -f ~/.zshrc ]]; then
	rm ~/.zshrc
fi

if [[ -f ~/.zshenv ]]; then
	rm ~/.zshenv
fi

if [[ -f .vimrc ]]; then
	rm ~/.vimrc
fi

bash ./install.sh
