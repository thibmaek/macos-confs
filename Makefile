# `make` default task
install: install-base post-install

PWD = $(shell pwd)

pre-install: mkdir -p "$HOME/.worker/"
  xcode-select --install

post-install: for APP in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
  "Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" "Transmission" "Twitter"; do
	  killall "${APP}" > /dev/null 2>&1
  done
  exec "$SHELL" -l

install-base:
  pre-install
  .install_homebrew
  .install_python
  .install_ruby

install-advanced:
  install-base
  .install_nvm
  .install_atom
  .install_gvm
  .setup_local
  post-install

.install_homebrew: bash $(PWD)/modules/brew.sh
  brew bundle --file=$(PWD)/extensions/Brewfile

.install_nvm: bash $(PWD)/modules/nvm.sh

.install_python: bash $(PWD)/modules/python.sh
  bash $(PWD)/extensions/pip.sh

.install_ruby: bash $(PWD)/modules/ruby.sh
  bundle install --gemfile=$(PWD)/extensions/Gemfile

.install_atom: apm install --packages-file $(PWD)/extensions/Atomfile

.install_gvm: bash $(PWD)/modules/gvm.sh

.setup_local: if [[ -f "$ROOT/worker.local" ]]; then bash "$ROOT/worker.local"; fi
