<div align="center">
  <h1>
    <a href="https://brew.sh">Brew</a>
  </h1>
  <blockquote>The missing package manager for macOS</blockquote>
  Installs packages with <a href="https://brew.sh">homebrew</a> and applications with <a href="https://caskroom.github.io/">homebrew-cask</a>
  <p></p>
</div>
<hr />

# Packages

1. Tap brew-bundle:

  ```console
  brew tap homebrew/bundle
  ```

2. Install the package file (brewfile) with brew-bundle:

  ```console
  brew bundle --file=./Brewfile
  ```

# Updates & upgrades

```console
brew cask upgrade && brew cask cleanup
brew update && brew upgrade && brew cleanup
```

## Brew sbin into path

- Add `export PATH="/usr/local/sbin:$PATH"` to your profile, sources or path file

## Add brew folders

- Add `export BREW_CELLAR="$(brew --cellar)"` your profile, sources or path file to have $BREW_CELLAR available in the shell
- Add `export BREW_HOME="$(brew --prefix)/Homebrew"` your profile, sources or path file to have $BREW_HOME available in the shell
- Add `export BREW_TAPS="$BREW_HOME/Library/Taps"` your profile, sources or path file to have $BREW_TAPS available in the shell

## Brew bash completion

Add to your profile, sources file, exports… :

```bash
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi
```

## Tab completion for bash

Add to your profile, sources file, exports… :

```bash
if command -v brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion.d" ]; then
  source "$(brew --prefix)/etc/bash_completion.d"
fi
```
