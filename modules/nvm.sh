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
$NVM_DIR/nvm.sh install v6.0.0
$NVM_DIR/nvm.sh alias default v6.0.0
