#!/usr/bin/env bash
curl https://raw.githubusercontent.com/creationix/nvm/v0.24.1/install.sh | bash

nvm install 0.11
nvm install 0.12
nvm alias stable 0.12
nvm alias default 0.11
nvm use 0.11
