#!/usr/bin/env bash
set -e

function pretty_print() {
  printf '\n\033[1m\033[34m%s\033[0m\n\n' "[macos-confs] ${1}…"
}

function install_rbenv() {
  if command -v brew > /dev/null && ! command -v rbenv > /dev/null; then
    pretty_print "🍻 Installing rbenv with brew"

    brew install rbenv

    pretty_print "You should run brew info rbenv and read the caveats about putting the eval() in your profile"
    eval "$(rbenv init -)"
    echo "if command -v rbenv > /dev/null; then eval \"\$(rbenv init -)\"; fi" >> "$HOME/.bash_profile"
  else
    pretty_print "📦 Installing rbenv from source (curl script)"

    curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

    echo "export PATH=\"$HOME/.rbenv/bin:\$PATH\"" >> "$HOME/.bash_profile"
    echo "eval \"\$(rbenv init -)\"" >> "$HOME/.bash_profile"
  fi
}

function install_ruby() {
  if ! command -v rbenv > /dev/null; then pretty_print "❗️ rbenv not found in PATH" && exit 1; fi

  pretty_print "💎 Installing Ruby 2.5.0 (default) with rbenv"

  rbenv install 2.5.0
  rbenv global 2.5.0
}

function install_gems() {
  if ! command -v gem > /dev/null; then pretty_print "❗️ gem not found in PATH" && exit 1; fi

  local packages=(
    bundler
    bundler_bash_completion
  )

  pretty_print "📦 Installing global gems (${packages[*]})"

  gem install "${packages[@]}"
}

read -rp "This will install Ruby through rbenv, the bundler gem and set it as default Ruby instance. Are you sure? (y/n) " -n 1
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  install_rbenv && install_ruby && install_gems
fi
