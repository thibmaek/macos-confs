#!/usr/bin/env bash

function pretty_print() {
  printf "\n\033[1m\033[34m%s\033[0m\n\n" "[macos-confs] ${1}…"
}

function install_powerline() {
  pip install --upgrade powerline-shell
}

if which pip > /dev/null; then
  install_powerline;
else
  pretty_print "❗️ pip is required for powerline"
  pretty_print "You can install pip yourself or run installers/install-python.sh"
  exit 1
fi
