#!/usr/bin/env bash

# Create .bash_profile if it doesn't exist
if [[ ! -f ~/.bash_profile ]]; then
  touch ~/.bash_profile
fi

# Directly source it to .bash_profile trought the pipe to bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | PROFILE=~/.bash_profile bash


# As long as the shell is not loaded `nvm` is unknown to the shell
# The shell will restart after worker is finished.
# For now they are run directly from the shell script in the nvm directory.
NVM_DIR="/Users/$(whoami)/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Should grab the latest version available to nvm
LATEST=$(nvm ls-remote | tail -1 | grep -E -o '.{0,0}v.{0,6}' | tr -d '\n')
nvm install $LATEST
