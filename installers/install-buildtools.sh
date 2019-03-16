#!/usr/bin/env bash
set -e

function pretty_print() {
  printf '\n\033[1m\033[34m%s\033[0m\n\n' "[macos-confs] ${1}…"
}

function install_buildtools() {
  if xcode-select --version > /dev/null; then
    pretty_print "⚠️ Buildtools (xcode-select) already installed"
    exit 0
  fi

  pretty_print "📦 Installing buildtools (xcode-select)"
  xcode-select --install
}

install_buildtools
