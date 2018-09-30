#!/usr/bin/env bash

function pretty_print() {
  printf '\n\033[1m\033[34m%s\033[0m\n\n' "[macos-confs] ${1}…"
}

function install_brew() {
  if ! make --version > /dev/null; then pretty_print "❗️ Commandline tools (xcode-select) not installed" && exit 1; fi

  if command -v brew > /dev/null; then pretty_print "🍻 Brew already installed" && exit 1; fi

  pretty_print "🍻 Installing brew (through system ruby)"

  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
}

install_brew
