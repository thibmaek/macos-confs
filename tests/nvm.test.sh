#!/usr/bin/env bash

fancy_echo() {
  local fmt="$1"; shift
  printf "\n$fmt\n" "$@ \e[0m"
}

curl -s -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | PROFILE=$HOME/.bash_profile bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if [[ ! -f $HOME/.bash_profile && ! -d $HOME/.nvm/ ]]; then
  fancy_echo "$FAIL No .bash_profile and .nvm directory found"
  exit 1
elif ! which npm >/dev/null; then
  fancy_echo "$FAIL npm not found in the shell. Set it in PATH."
  exit 1
fi

fancy_echo "$PASS .bash_profile and .nvm exist, npm is on PATH"
bash "$ROOT/extensions/npm"
