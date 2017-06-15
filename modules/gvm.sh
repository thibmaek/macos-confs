#!/usr/bin/env bash

# Create .bash_profile if it doesn't exist
if [[ ! -f ~/.bash_profile ]]; then touch ~/.bash_profile; fi

# Needs to be installed on macOS for gvm
brew install mercurial

# Directly source it to .bash_profile trought the pipe to bash
curl -o- https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | PROFILE=~/.bash_profile bash

# As long as the shell is not loaded `nvm` is unknown to the shell
# The shell will restart after worker is finished.
# For now they are run directly from the shell script in the nvm directory.
source /Users/thibaultmaekelbergh/.gvm/scripts/gvm

# Go 1.5+ removed the C compilers from the toolchain and replaced them with one written in Go
# In order to compile Go 1.5+, make sure Go 1.4 is installed first.
gvm install go1.4 -B
gvm use go1.4 --default
