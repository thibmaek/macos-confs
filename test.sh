#! /usr/bin/env bash

# Just testing nvm for now since others require
# a more advanced testing workflow.
# Since this runs on Linux servers I'm not able to
# test OS X specific installers

for file in $(find ./modules -name 'nvm.sh'); do
  ./$file
done
