#! /usr/bin/env bash

for file in $(find ./modules -name '*.sh' ! -name 'brew.sh' ! -name 'osx.sh'); do
  ./$file
done
