#!/usr/bin/env bash

fancy_echo() {
  local fmt="$1"; shift
  printf "\n$fmt\n" "$@ \e[0m"
}

if which xcode-select >/dev/null; then
  fancy_echo "$PASS Xcode devtools already installed!"
else
  fancy_echo "$FAIL [N/A:] Run xcode-select --install" && exit 1
fi
