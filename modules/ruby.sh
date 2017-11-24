#!/usr/bin/env bash

# Using rbenv over macOS pre-installed Ruby in Brewfile
eval "$(rbenv init -)"

rbenv install 2.4.0
rbenv global 2.4.0

gem install bundler
gem install bundler_bash_completion
