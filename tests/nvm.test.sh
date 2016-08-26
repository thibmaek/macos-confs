#!/usr/bin/env bash

local NPMTEST=../extensions/npm

curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | PROFILE=$HOME/.bash_profile bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if [ ! -f $HOME/.bash_profile && ! -d $HOME/.nvm/]; then
  exit 1
else
  if !which npm >/dev/null; then exit 1; fi
  bash $NPMTEST
fi
