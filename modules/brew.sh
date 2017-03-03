#!/usr/bin/env bash

# 1. Check if xcode tools are installed and install brew
if make --version >/dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
  brew tap Homebrew/bundle
else
  echo "Command line tools not installed!" && exit 1
fi
