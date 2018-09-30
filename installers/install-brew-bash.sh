#!/usr/bin/env bash

function pretty_print() {
  printf '\n\033[1m\033[34m%s\033[0m\n\n' "[macos-confs] ${1}…"
}

function install_brew_bash() {
  if ! command -v brew > /dev/null; then pretty_print "❗️ brew not installed" && exit 1; fi

  pretty_print "🍻 Installing GNU bash (through brew)"
  brew install bash

  pretty_print "⚠️ Changing from BSD bash (macOS) to GNU bash (brew)"
  if ! grep -q '/usr/local/bin/bash' /etc/shells; then
    echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
    chsh -s /usr/local/bin/bash;

    pretty_print "Auto-reloading your shell by executing a login shell"
    exec "$SHELL" -l
  fi;
}

install_brew_bash
