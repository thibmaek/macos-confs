#!/usr/bin/env bash

if which xcode-select >/dev/null; then
  echo 'Xcode devtools already installed'
else
  xcode-select --install
fi
