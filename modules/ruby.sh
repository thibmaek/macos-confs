#!/usr/bin/env bash

# Using rbenv over OS X pre-installed Ruby in Brewfile
rbenv install 2.2.2
rbenv global 2.2.2

echo "export PATH=\"$HOME/.rbenv/bin:$PATH\"" >> ~/.bash_profile
echo "eval \"$(rbenv init -)\"" >> ~/.bash_profile
echo "if which rbenv > /dev/null; then eval \"$(rbenv init -)\"; fi" >> ~/.bash_profile

echo "gem: --no-ri --no-rdoc --no-document" > ~/.gemrc
