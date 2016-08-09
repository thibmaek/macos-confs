if which xcode-select >/dev/null; then
  echo 'Xcode devtools already installed'
else
  echo '[N/A:] Run `xcode-select --install`' && exit 1
fi
