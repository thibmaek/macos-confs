#!/usr/bin/env bash

###
# This file will start all tasks.
# Comment out anything you dont want installed.
###

# Set this env to current dir and export a workdir
ROOT=$PWD
mkdir -p "$HOME/.worker/"

# 1. Install Command Line Tools.
echo "Updating xcode-select..."
xcode-select --install;

# 2. Install homebrew.
echo "Installing brew..."
bash "$ROOT/modules/brew.sh"

# 3. Install formulas and cask from Brewfile.
echo "Reading from brewfile..."
brew bundle --file="$ROOT/extensions/Brewfile"

# 4. Install Node and NPM trough NVM.
echo "Downloading and installing nvm..."
bash "$ROOT/modules/nvm.sh"

# 5. Install Python versions for pyenv.
echo "Installing pyenv versions..."
bash "$ROOT/modules/python.sh"

echo "Installing modules from pip..."
bash "$ROOT/extensions/pip.sh"

# 6. Use the .gemrc file for Rubygems
echo "Presetting Ruby..."
bash "$ROOT/modules/ruby.sh"

# 7. Install Rubygems.
echo "Installing some gems..."
bundle install --gemfile="$ROOT/extensions/Gemfile"

# 8. Install APM packages & themes
echo "Installing apm packages..."
apm install --packages-file "$ROOT/extensions/Atomfile"

# 9. Installing and downloading Go through gvm
echo "Downloading and installing gvm..."
bash "$ROOT/modules/gvm.sh"

# 10. Perform additional local changes described in ./worker.local
if [[ -f "$ROOT/worker.local" ]]; then bash "$ROOT/worker.local"; fi

# Reload modified applications
for APP in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
"Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" \
"Transmission" "Twitter"; do
	killall "${APP}" > /dev/null 2>&1
done

echo "Done. Note that some of these changes require a logout/restart to take effect."
echo "Now reloading shell..."
exec "$SHELL" -l
