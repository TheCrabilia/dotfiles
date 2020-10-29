#!/bin/bash

# Colors
GREEN='\033[0;32m'
NC='\033[0;m'

if [ ! $(command -v sudo) ]; then
	echo "Sudo not found! Please install Sudo."
	exit 1
fi

if [ $(command -v apt) ]; then
	echo "Apt manager found!"
	echo "Installing required staff..."
	sudo apt update >/dev/null
	sudo apt install -y curl git zsh chroma >/dev/null
fi

if [ $(command -v yum) ]; then
	echo "Yum manager found!"
	echo "Installing required staff..."
	sudo yum update -y >/dev/null
	sudo yum install -y curl git zsh libchromaprint-devel >/dev/null
fi

echo "Installing Oh-My-Zsh framework..."
yes | bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" >/dev/null

cp ./zshrc $HOME/.zshrc
cp ./my-custom-theme.zsh-theme $HOME/.oh-my-zsh/custom/themes/

echo "Changing user default shell..."
sudo usermod --shell $(which zsh) $USER

echo "Installing ZSH external plugins..."
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "Zsh-AutoSuggestions plugin (${GREEN}Done${NC})"
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "Zsh-Syntax-Highlighting plugin (${GREEN}Done${NC}"
# zsh-256color
git clone https://github.com/chrissicool/zsh-256color.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-256color
echo "Zsh-256color plugin (${GREEN}Done${NC})"

echo "All done! Please restart your terminal!"
