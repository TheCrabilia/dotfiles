# Dotfiles

## Manual installation

### MacOS

1. Install required packages

```bash
brew install zsh neovim fzf exa zoxide bat fd binutils findutils coreutils grep
```

2. Install nerd font

```bash
brew tap homebrew/cask-fonts
brew install font-fira-code-nerd-font
```

## Additiaonal MacOS configurations

- Disable press and hold popup

```bash
defaults write -g ApplePressAndHoldEnabled -bool false
```
