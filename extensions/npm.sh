#!/usr/bin/env bash

packages=(
  create-dmg
  create-react-native-app
  fkill-cli
  generator-devine-boilerplate
  generator-module-boilerplate
  gitmoji-cli
  hpm-cli
  mklicense
  nativefier
  pkg
  react-native-cli
  serve
  speed-test
  yo
)

# Default try and update npm as well
npm install -g npm "${packages[@]}"
