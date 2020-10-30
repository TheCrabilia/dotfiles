#!/bin/bash

if [ ! $(command -v sudo) ]; then
	echo "Sudo not found! Please install Sudo."
	exit 1
fi

# Debian, etc.
if [ $(command -v apt) ]; then
	echo "Apt manager found! Installing required staff..."
	MANAGER=apt
fi

# RHEL, etc.
if [ $(command -v yum) ]; then
	echo "Yum manager found! Installing required staff..."
	MANAGER=yum
	sudo $MANAGER install -yq epel-release
fi

sudo $MANAGER install -yq curl git zsh python3-pygments

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
