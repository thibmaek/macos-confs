#!/usr/bin/env bash
set -e

function pretty_print() {
  printf '\n\033[1m\033[34m%s\033[0m\n\n' "[macos-confs] ${1}…"
}

function install_node() {
  if command -v brew > /dev/null; then
    pretty_print "🍻 Installing node (latest) with brew"
    brew install node
  else
    if command -v node > /dev/null; then
      pretty_print "⚠️ node already installed"
      exit 1
    fi

    pretty_print "📦 Installing node from source (curl script & .pkg)"
    pretty_print "❗️ This method installs node as the root user, and is considered a security risk"

    curl "https://nodejs.org/dist/latest/node-${VERSION:-$(wget -qO- https://nodejs.org/dist/latest/ \
      | sed -nE 's|.*>node-(.*)\.pkg</a>.*|\1|p')}.pkg" > "$HOME/Downloads/node-latest.pkg" && sudo installer -store \
      -pkg "$HOME/Downloads/node-latest.pkg" -target "/"
  fi
}

function install_npm_modules() {
  if ! command -v npm > /dev/null; then
    pretty_print "❗️ npm not installed"
    exit 1
  fi

  local packages=(
    create-react-app
    create-react-native-app
    nativefier
    serve
    speed-test
  )

  pretty_print "📦 Installing node modules ${packages[*]}"

  npm install -g npm "${packages[@]}"
}

read -rp "This will install Node through brew/curl, some node modules and set it as default Node instance. Are you sure? (y/n) " -n 1
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  install_node && install_npm_modules
fi
