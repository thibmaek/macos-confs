#!/usr/bin/env bash

function pretty_print() {
  printf '\n\033[1m\033[34m%s\033[0m\n\n' "[macos-confs] ${1}…"
}

function install_pyenv() {
  if command -v brew > /dev/null; then
    pretty_print "🍻 Installing python (latest v3 and v2) with brew"

    brew install python

    if [ -f "$HOME/.bash_sources" ]; then
      if ! grep -q "/usr/local/opt/python/libexec/bin" "$HOME/.bash_sources"; then
        {
          echo "export PATH=\"/usr/local/opt/python/libexec/bin:\$PATH\""
        } >> "$HOME/.bash_profile"
      else
        pretty_print "Brew python already correctly sourced in .bash_sources"
      fi
    else
      if ! grep -q "/usr/local/opt/python/libexec/bin" "$HOME/.bash_profile"; then
        {
          echo "export PATH=\"/usr/local/opt/python/libexec/bin:\$PATH\""
        } >> "$HOME/.bash_profile"
      else
        pretty_print "Brew python already correctly sourced in .bash_profile"
      fi
    fi
  else
    pretty_print "🐍 Python 2.7 comes pre-installed with macOS."
  fi
}

function install_pip_pkgs() {
  if ! command -v pip > /dev/null; then pretty_print "❗️ pip not found in PATH" && exit 1; fi

  local packages=(
    glances
    virtualenv
  )

  pretty_print "🐍 Upgrading pip to latest version"
  pip install --upgrade pip

  pretty_print "📦 Installing global pip packages (${packages[*]})"

  pip install "${packages[@]}"
}

install_pyenv && install_python && install_pip_pkgs
