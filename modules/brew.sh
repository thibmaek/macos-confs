#!/usr/bin/env bash

function install_brew() {
  if which brew > /dev/null; then
    echo "brew already installed..."
  else
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
    brew tap Homebrew/bundle
  fi
}

# 1. Check if xcode tools are installed and install brew
if make --version >/dev/null; then
  install_brew
else
  echo "Command line tools not installed!" && exit 1
fi
