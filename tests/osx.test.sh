if which xcode-select >/dev/null; then
  echo 'Xcode devtools already installed'
else
  echo '[N/A:] Run `xcode-select --install`' && exit 1
fi

curl -o --silent $HOME/.hyperterm.js https://gist.githubusercontent.com/thibmaek/1ac2111ffb4f3f12b917f224f748139f/raw/a6d4f9ff8a784df5de827ee7c10fd94c85f9856b/.hyperterm.js

if [[ ! -f $HOME/.hyperterm.js ]]; then
  exit 1
else
  echo 'Hyperterm config downloaded and present'
fi
