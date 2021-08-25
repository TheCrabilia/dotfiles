#!/usr/bin/env bash

mtenv_path=$HOME/.mtenv
distro=$(cat /etc/os-release | grep -E "^ID=" | sed -e 's/^ID=//' -e 's/"//g')

case $distro in
    arch)
        echo "Arch like Linux distribution found. Installing required packages..."
        pacman -S zsh vim curl wget git gawk
        ;;

    debian|ubuntu)
        echo "Debian like Linux distribution found. Installing required packages..."
        apt-get install -y zsh vim curl wget git gawk
        ;;

    almalinux|centos|fedora)
        echo "RHEL like Linux distribution found. Installing required packages..."
        dnf install -y epel-release zsh vim curl wget git gawk
        ;;

    *)
        echo "No supported Linux distribution found. Exiting..."
        exit 1
        ;;
esac

echo "Cloning mtenv repository to home directory..."
git clone https://github.com/TheCrabilia/mtenv $mtenv_path

echo "Installing vim plugin manager..."
curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# echo "Installing vim plugins..."
# vim -c PlugInstall! -c qa!

echo "Copying terminal environment files..."
cd $mtenv_path
cfg_files=( zshrc zshenv vimrc tmux.conf )
for file in $cfg_files; do
    cp $file $HOME/.$file
done

echo "Done."
