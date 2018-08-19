#!/usr/bin/env bash

function pretty_print() {
  printf '\n\033[1m\033[34m%s\033[0m\n\n' "[macos-confs] ${1}…"
}

function install_rbenv() {
  if which brew > /dev/null && ! which rbenv > /dev/null; then
    pretty_print "🍻 Installing rbenv with brew"

    brew install rbenv

    pretty_print "You should run brew info rbenv and read the caveats about putting the eval() in your profile"
    eval "$(rbenv init -)"
    echo "if which rbenv > /dev/null; then eval \"\$(rbenv init -)\"; fi" >> "$HOME/.bash_profile"
  else
    pretty_print "📦 Installing rbenv from source (curl script)"

    curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

    echo "export PATH=\"$HOME/.rbenv/bin:\$PATH\"" >> "$HOME/.bash_profile"
    echo "eval \"\$(rbenv init -)\"" >> "$HOME/.bash_profile"
  fi
}

function install_ruby() {
  if ! which rbenv > /dev/null; then pretty_print "❗️ rbenv not found in PATH" && exit 1; fi

  pretty_print "💎 Installing Ruby 2.5.0 (default) with rbenv"

  rbenv install 2.5.0
  rbenv global 2.5.0
}

function install_gems() {
  if ! which gem > /dev/null; then pretty_print "❗️ gem not found in PATH" && exit 1; fi

  local packages=(
    bundler
    bundler_bash_completion
  )

  pretty_print "📦 Installing global gems (${packages[*]})"

  gem install "${packages[@]}"
}

install_rbenv && install_ruby && install_gems
