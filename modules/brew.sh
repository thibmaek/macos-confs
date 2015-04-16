#!/usr/bin/env bash

# 1. Check if xcode tools are installed and install brew
if ! [[ which xcode-select ]]; then
  echo "Command line tools not installed!"
  return
else
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
fi

# 2. Tap boneyard for Brewfile support
if ! [[ which brew ]]; then
  echo "brew not installed/found!"
  return
else
  brew tap homebrew/boneyard
fi
