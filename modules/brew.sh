#!/usr/bin/env bash

# 1. Check if xcode tools are installed and install brew
if which xcode-select >/dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
else
  echo "Command line tools not installed!"
fi

# 2. Tap boneyard for Brewfile support
if which brew >/dev/null; then
  brew tap Homebrew/bundle
else
  echo "brew not installed/found!"
fi
