# Dotfiles

## MacOS installation

1. Install packages from Homebrew bundle

```bash
brew bundle --file Brewfile
```

2. Restow configuration files

```bash
zsh restow
```

3. Run git set up script

```bash
zsh setup-git
```

4. Run 1password set up script

```bash
zsh setup-1password
```

## Additional MacOS configurations

- Disable press and hold popup

  ```bash
  defaults write -g ApplePressAndHoldEnabled -bool false
  ```

- Fix shared clipboard

  ```bash
  defaults write ~/Library/Preferences/com.apple.coreservices.useractivityd.plist ClipboardSharingEnabled 1
  ```
