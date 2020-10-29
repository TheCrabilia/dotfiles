#!/bin/bash

if [ ! $(command -v sudo) ]; then
	echo "Sudo not found! Please install Sudo."
	exit 1
fi

# Debian, etc.
if [ $(command -v apt) ]; then
	echo "Apt manager found!"
	echo "Installing required staff..."
	sudo apt update -q 
	sudo apt install -yq curl git zsh chroma
fi

# RHEL, etc.
if [ $(command -v yum) ]; then
	echo "Yum manager found!"
	echo "Installing required staff..."
	sudo yum update -yq
	sudo yum install -yq curl git zsh libchromaprint-devel
fi

echo "Installing Oh-My-Zsh framework..."
yes | bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp ./zshrc $HOME/.zshrc
cp ./my-custom-theme.zsh-theme $HOME/.oh-my-zsh/custom/themes/

echo "Changing user default shell..."
sudo usermod --shell $(which zsh) $USER

echo "Installing ZSH external plugins..."
# zsh-autosuggestions
git clone -q https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
if [ $? = 0 ]; then
	echo "Zsh-AutoSuggestions plugin (Done)"
fi
# zsh-syntax-highlighting
git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
if [ $? = 0 ]; then
	echo "Zsh-Syntax-Highlighting plugin (Done)"
fi
# zsh-256color
git clone -q https://github.com/chrissicool/zsh-256color.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-256color
if [ $? = 0 ]; then
	echo "Zsh-256color plugin (Done)"
fi

echo "Done!"
