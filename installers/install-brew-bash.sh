#!/usr/bin/env bash

function pretty_print() {
  printf '\n\033[1m\033[34m%s\033[0m\n\n' "[macos-confs] ${1}…"
}

function install_brew_bash() {
  if ! which brew > /dev/null; then pretty_print "❗️ brew not installed" && exit 1; fi

  pretty_print "🍻 Installing GNU bash (through brew)"
  brew install bash

  pretty_print "⚠️ Changing from BSD bash (macOS) to GNU bash (brew)"
  pretty_print "Reloading the shell by restarting your terminal or with exec \$SHELL -l is advised"
  if ! grep -q '/usr/local/bin/bash' /etc/shells; then
    echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
    chsh -s /usr/local/bin/bash;
  fi;
}

install_brew_bash
