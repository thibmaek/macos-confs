#!/usr/bin/env bash

#####################################################
# To start worker, run this file (preferably as root)
#
# You can turn off modules & extensions by commenting
# out the lines below the echo's
################################

# Make sure we can execute each file
for MODULE in ./modules/*;do chmod +x $MODULE done

# 1. Run OS X modifications.
echo "Presetting macOS… ⌘"
cd modules && ./macos.sh && cd ../

# 2. Install Command Line Tools.
echo "Installing xcode-select… 🔨"
cd modules && ./xcode.sh && cd ../

# 3. Install homebrew.
echo "Installing brew… 🍻"
cd modules && ./brew.sh && cd ../

# 4. Install formulas and cask from Brewfile.
echo "Reading from brewfile…"
cd extensions && brew bundle && cd ../

# 5. Install Node and NPM trough NVM.
echo "Downloading and installing nvm…"
cd modules && ./nvm.sh && cd ../

# 6. Install global node modules.
echo "Installing node modules…"
cd extensions && ./npm && cd ../

# 7. Install Python versions for pyenv.
echo "Installing pyenv versions 🐍"
cd modules && ./python.sh && cd ../

echo "Installing modules from pip"
cd extensions ./pip && cd ../

# 8. Use the .gemrc file for Rubygems
echo "Presetting Ruby…"
cd modules && ./ruby.sh && cd ../

# 9. Install Rubygems.
echo "Installing some gems 💎"
cd extensions && bundle install && cd ../

# 10. Install APM packages & themes
echo "Installing apm packages…"
cd extensions && apm install --packages-file Atomfile && cd ../

# 11. Perform additional local changes described in ~/.worker.local
. "$HOME/.worker.local"

# Reload modified applications
for APP in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
"Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" \
"Transmission" "Twitter"; do
	killall "${APP}" > /dev/null 2>&1
done

echo "Done. Note that some of these changes require a logout/restart to take effect."
echo "Now reloading shell…"
exec $SHELL -l
