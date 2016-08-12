#!/usr/bin/env bash

local NPMTEST=../extensions/npm
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | PROFILE=$HOME/.bash_profile bash

if [[ ! -f $HOME/.bash_profile && ! -d $HOME/.nvm/]]; then
  exit 1
else
  if !which npm >/dev/null; then exit 1; fi
  bash $NPMTEST
fi
