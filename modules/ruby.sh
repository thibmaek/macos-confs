#!/usr/bin/env bash

# make --user-install a default so gem install
# doesn't require sudo
echo "gem: --user-install" > ~/.gemrc
