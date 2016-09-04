#!/usr/bin/env bash

#####################################################
# To start worker, run this file (preferably as root)
#
# You can turn off modules & extensions by commenting
# out the lines below the echo's
################################

# Export env ROOT to current directory run test from absolute path
ROOT=$PWD

# Make sure we can execute each file
for MODULE in $ROOT/modules/*; do chmod +x $MODULE; done

# 1. Run OS X modifications.
echo "Presetting macOS..."
. "$ROOT/modules/macos.sh"

# 2. Install Command Line Tools.
echo "Installing xcode-select..."
. "$ROOT/modules/xcode.sh"

# 3. Install homebrew.
echo "Installing brew..."
. "$ROOT/modules/brew.sh"

# 4. Install formulas and cask from Brewfile.
echo "Reading from brewfile..."
brew bundle "$ROOT/extensions/Brewfile"

# 5. Install Node and NPM trough NVM.
echo "Downloading and installing nvm..."
. "$ROOT/modules/nvm.sh"

# 6. Install global node modules.
echo "Installing node modules..."
. "$ROOT/extensions/npm"

# 7. Install Python versions for pyenv.
echo "Installing pyenv versions..."
. "$ROOT/modules/python.sh"

echo "Installing modules from pip..."
. "$ROOT/extensions/pip"

# 8. Use the .gemrc file for Rubygems
echo "Presetting Ruby..."
. "$ROOT/modules/Ruby.sh"

# 9. Install Rubygems.
echo "Installing some gems..."
. "$ROOT/extensions/ruby.sh"

# 10. Install APM packages & themes
echo "Installing apm packages..."
apm install --packages-file "$ROOT/extensions/Atomfile"

# 11. Perform additional local changes described in ~/.worker.local
. "$ROOT/worker.local"

# Reload modified applications
for APP in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
"Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" \
"Transmission" "Twitter"; do
	killall "${APP}" > /dev/null 2>&1
done

echo "Done. Note that some of these changes require a logout/restart to take effect."
echo "Now reloading shell..."
exec $SHELL -l
