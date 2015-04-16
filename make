#!/usr/bin/env bash

#####################################################
# To start worker, run this file (preferably as root)
#
# You can turn off modules & extensions by commenting
# out the lines below the echo's
################################

# 1. Run OS X modifications.
echo "Presetting OS X…"
cd ./modules && ./osx.sh && cd ../

# 2. Install Command Line Tools.
echo "Installing xcode-select…"
cd ./modules && ./xcode.sh && cd ../

# 3. Install homebrew.
echo "Installing brew…"
cd ./modules && ./brew.sh && cd ../

# 4. Install formulas and cask from Brewfile.
echo "Reading from brewfile…"
cd ./extensions && brew bundle && cd ../

# 5. Install Node and NPM trough NVM.
echo "Downloading and installing nvm…"
cd ./modules && ./nvm.sh && cd ../

# 6. Install global node modules.
echo "Installing node modules…"
cd ./extensions && ./npm && cd ../

# 7. Install Python versions for pyenv.
echo "Installing pyenv versions"
cd ./extensions && ./Python && cd ../

# Reload modified applications
for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
"Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" \
"Terminal" "Transmission" "Twitter"; do
	killall "${app}" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
