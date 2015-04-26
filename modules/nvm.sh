#!/usr/bin/env bash
curl https://raw.githubusercontent.com/creationix/nvm/v0.24.1/install.sh | bash

# nvm sources in the .bashrc by default. If .bash_profile
# is available, this if sources it in the .bash_profile instead.
# You still need to manually remove it from .bashrc though…
if [[ -f ~/.bash_profile ]]; then
  echo "export NVM_DIR='/Users/$(whoami)/.nvm'" >> ~/.bash_profile
  echo "[ -s \"\$NVM_DIR/nvm.sh\" ] && . \"\$NVM_DIR/nvm.sh\"" >> ~/.bash_profile
fi

# As long as the shell is not loaded `nvm` is unknown to the shell
# The shell will restart after worker is finished.
# For now they are run directly from the shell script in the nvm directory.
$NVM_DIR/nvm.sh install 0.11
$NVM_DIR/nvm.sh install 0.12
$NVM_DIR/nvm.sh alias stable 0.12
$NVM_DIR/nvm.sh alias default 0.11
$NVM_DIR/nvm.sh use 0.11
