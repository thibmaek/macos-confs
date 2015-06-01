#! /usr/bin/env bash

for file in $(find ./modules -name '*.sh'); do
  bash -n $file
done