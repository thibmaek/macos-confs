#!/usr/bin/env bash
set -e

function pretty_print() {
  printf '\n\033[1m\033[34m%s\033[0m\n\n' "[macos-confs] ${1}…"
}

function install_brew_bash() {
  local brewDir
  brewDir=$(brew --prefix)

  if ! command -v brew > /dev/null; then
    pretty_print "❗️ brew not installed"
    exit 1
  fi

  pretty_print "🍻 Installing GNU bash (through brew)"
  brew install bash

  pretty_print "⚠️ Changing from BSD bash (macOS) to GNU bash (brew)"
  if ! grep -q "$brewDir/bin/bash" /etc/shells; then
    echo "$brewDir/bin/bash" | sudo tee -a /etc/shells
    chsh -s "$brewDir/bin/bash"

    pretty_print "Auto-reloading your shell by executing a login shell"
    exec "$SHELL" -l
  fi;
}

read -rp "This will install bash via brew and set it as the default shell. Are you sure? (y/n) " -n 1
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  install_brew_bash
fi
