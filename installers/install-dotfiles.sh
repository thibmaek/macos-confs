#!/usr/bin/env bash
set -e

function pretty_print() {
  printf '\n\033[1m\033[34m%s\033[0m\n\n' "[macos-confs] ${1}…"
}

function download_dotfiles() {
  if ! command -v git > /dev/null
    then pretty_print "❗️ git was not found on PATH"
    exit 1
  fi

  pretty_print "📦 Downloading dotfiles repo from thibmaek/dotfiles through Github"
  git clone https://github.com/thibmaek/dotfiles "$HOME/.dotfiles-src"

  local currentpath=$PWD

  cd "$HOME/.dotfiles-src" || return
  chmod +x ./bin/install_repository.sh

  pretty_print "🔨 Installing dotfiles for user"
  cd ./bin || return
  ./install_repository.sh

  cd "$currentpath" || exit
}

read -rp "This will download and install all dotfiles from https://github.com/thibmaek/dotfiles to $HOME. Are you sure? (y/n) " -n 1
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  download_dotfiles
fi
