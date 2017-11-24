#!/usr/bin/env bash

echo "You should run brew info pyenv and read the caveats about putting the eval() in your profile"
eval "$(pyenv init -)"

pyenv install 3.6.0
pyenv install 2.7.12
pyenv global 2.7.12
