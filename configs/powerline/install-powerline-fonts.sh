#!/usr/bin/env bash

function pretty_print() {
  printf "\\n\\033[1m\\033[34m%s\\033[0m\\n\\n" "[macos-confs] ${1}…"
}

function install_powerline_fonts() {
  pretty_print "📦 Downloading powerline fonts"
  git clone https://github.com/powerline/fonts "$HOME/.powerline-fonts-src"

  pretty_print "🖋 Installing powerline fonts"
  "$HOME/.powerline-fonts-src/install.sh"
  rm -rf "$HOME/.powerline-fonts-src"
}

if command -v powerline-shell > /dev/null; then
  install_powerline_fonts;
else
  pretty_print "❗️ powerline-shell not installed" && exit 1
fi
