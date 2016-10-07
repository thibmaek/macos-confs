#!/usr/bin/env bash

echo "You should run brew info pyenv and read the caveats about putting the eval() in your profile"
eval "$(pyenv init -)"

pyenv update
pyenv install 2.7.10
pyenv shell 2.7.10
pyenv global 2.7.10
