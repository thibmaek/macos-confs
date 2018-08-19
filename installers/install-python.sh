#!/usr/bin/env bash

function pretty_print() {
  printf '\n\033[1m\033[34m%s\033[0m\n\n' "[macos-confs] ${1}…"
}

function install_pyenv() {
  if which brew > /dev/null; then
    pretty_print "🍻 Installing pyenv with brew"

    brew install pyenv

    pretty_print "You should run brew info pyenv and read the caveats about putting the eval() in your profile"
    eval "$(pyenv init -)"
    echo "if which pyenv > /dev/null; then eval \"\$(pyenv init -)\"; fi" >> "$HOME/.bash_profile"
  else
    if which pyenv > /dev/null; then pretty_print "⚠️ pyenv already installed" && exit 1; fi

    pretty_print "📦 Installing pyenv from source (curl script)"

    curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

    {
      echo "export PATH=\"${PYENV_ROOT}/bin:\$PATH\""
      echo "eval \"\$(pyenv init -)\""
      echo "eval \"\$(pyenv virtualenv-init -)\""
    } >> "$HOME/.bash_profile"
  fi
}

function install_python() {
  if ! which pyenv > /dev/null; then pretty_print "❗️ pyenv not found in PATH" && exit 1; fi

  pretty_print "🐍 Installing Python 3.6.4 & 2.7.14 (default) with pyenv"

  pyenv install 3.6.4
  pyenv install 2.7.14
  pyenv global 2.7.14
}

function install_pip_pkgs() {
  if ! which pip > /dev/null; then pretty_print "❗️ pip not found in PATH" && exit 1; fi

  local packages=(
    bottle
    glances
  )

  pretty_print "🐍 Upgrading pip to latest version"
  pip install --upgrade pip

  pretty_print "📦 Installing global pip packages (${packages[*]})"

  pip install "${packages[@]}"
}

install_pyenv && install_python && install_pip_pkgs
