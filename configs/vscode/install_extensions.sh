#!/usr/bin/env bash

function pretty_print() {
  printf "\\n\\033[1m\\033[34m%s\\033[0m\\n\\n" "[macos-confs] ${1}…"
}

function install_extensions() {
  local extensions=(
    andys8.jest-snippets
    bungcip.better-toml
    christian-kohler.npm-intellisense
    cssho.vscode-svgviewer
    dakara.dakara-foldplus
    DavidAnson.vscode-markdownlint
    dbaeumer.vscode-eslint
    dracula-theme.theme-dracula
    eamodio.gitlens
    eg2.vscode-npm-script
    eriklynd.json-tools
    felixrieseberg.vsc-travis-ci-status
    file-icons.file-icons
    flowtype.flow-for-vscode
    frankschmid.serverless-vscode
    freebroccolo.reasonml
    kisstkondoros.vscode-gutter-preview
    kondratiev.sshextension
    lihui.vs-color-picker
    mikestead.dotenv
    mrmlnc.vscode-postcss-sorting
    ms-python.python
    ms-vscode.atom-keybindings
    ms-vscode.node-debug2
    ms-vsliveshare.vsliveshare
    msjsdiag.debugger-for-chrome
    patrys.vscode-code-outline
    PeterJausovec.vscode-docker
    Prisma.vscode-graphql
    rafamel.subtle-brackets
    redhat.vscode-yaml
    ricard.postcss
    richie5um2.vscode-sort-json
    sdras.night-owl
    Shan.code-settings-sync
    shinnn.stylelint
    silvenon.mdx
    timonwong.shellcheck
    tuxtina.json2yaml
    vsmobile.vscode-react-native
    wayou.vscode-todo-highlight
    wix.vscode-import-cost
    zhouronghui.propertylist
  )

  pretty_print "📦 Installing extensions: ${extensions[*]}"

  for ext in "${extensions[@]}"; do
    code --install-extension "$ext"
  done
}

if command -v code > /dev/null; then
  install_extensions;
else
  pretty_print "❗️ You need the code CLI to install extensions via this script"
  pretty_print "See https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line"
  exit 1
fi
