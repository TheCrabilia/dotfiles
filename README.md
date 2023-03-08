# Dotfiles

## Automatic installation

Run installation script

```bash
./install.sh
```

## Manual installation

### MacOS

1. Install required packages

```bash
brew install zsh neovim fzf exa zoxide bat fd binutils findutils coreutils grep node rust pyenv pyenv-virtualenv
```

2. Install nerd font

```bash
brew tap homebrew/cask-fonts
brew install font-fira-code-nerd-font
```

2. Create dotfile symlinks

```bash
ln -s $(pwd)/home/zshrc ~/.zshrc
ln -s $(pwd)/home/zimrc ~/.zimrc
ln -s $(pwd)/home/zshenv ~/.zshenv
``

3. Create zsh and neovim configurations symlinks

```bash
ln -s $(pwd)/zsh ~/.config/zsh
ln -s $(pwd/nvim ~/.config/zsh
```

## Additiaonal MacOS configurations

- Disable press and hold popup

```bash
defaults write -g ApplePressAndHoldEnabled -bool false
```
