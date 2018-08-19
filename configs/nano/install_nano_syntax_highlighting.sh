#!/usr/bin/env bash

function pretty_print() {
  printf "\n\033[1m\033[34m%s\033[0m\n\n" "[macos-confs] ${1}…"
}

function install_nano_syntax_highlighting() {
  if ! which nano > /dev/null; then
    pretty_print "❗️ nano not found in PATH"
    exit 1
  fi
  if ! which wget > /dev/null; then
    pretty_print "❗️ wget is required by the nano syntax highlighting script"
    exit 1
  fi

  pretty_print "🖍 Installing nano syntax highlighting"
  curl -L https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | bash
}

install_nano_syntax_highlighting
