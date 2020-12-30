#!/bin/bash

echo "Let's start the party!"
read -p "Press any key to continue... " -n1 -s
echo  '\n'

# Install homebrew (Uncomment)
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "macOS Settings..."
# System Preferences > General > Appearance
defaults write -globalDomain AppleInterfaceStyle -string "Dark"

# System Preferences > General > Click in the scrollbar to: Jump to the spot that's clicked
defaults write -globalDomain AppleScrollerPagingBehavior -bool true

# System Preferences > General > Sidebar icon size: Medium
defaults write -globalDomain NSTableViewDefaultSizeMode -int 2

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# System Preferences > Desktop & Screen Saver > Start after: Never
defaults -currentHost write com.apple.screensaver idleTime -int 0

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# System Preferences > Dock > Size:
defaults write com.apple.dock tilesize -int 36

# System Preferences > Dock > Magnification:
defaults write com.apple.dock magnification -bool true

# System Preferences > Dock > Size (magnified):
defaults write com.apple.dock largesize -int 54

# System Preferences > Dock > Minimize windows using: Scale effect
defaults write com.apple.dock mineffect -string "scale"

# System Preferences > Dock > Minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool true

# System Preferences > Dock > Automatically hide and show the Dock:
#defaults write com.apple.dock autohide -bool true

# System Preferences > Dock > Automatically hide and show the Dock (duration)
#defaults write com.apple.dock autohide-time-modifier -float 0.5

# System Preferences > Dock > Automatically hide and show the Dock (delay)
#defaults write com.apple.dock autohide-delay -float 0

# System Preferences > Dock > Show indicators for open applications
defaults write com.apple.dock show-process-indicators -bool true

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# System Preferences > Mission Controll > Automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool true

# System Preferences > Mission Controll > Dashboard
defaults write com.apple.dock dashboard-in-overlay -bool true

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# System Preferences > Keyboard >
defaults write NSGlobalDomain KeyRepeat -int 2

# System Preferences > Keyboard >
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# System Preferences > Trackpad > Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# System Preferences > Accessibility > Mouse & Trackpad > Trackpad Potions
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

defaults write com.apple.AppleMultitouchTrackpad Dragging -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool false

# System Preferences > Accessibility > Mouse & Trackpad > Trackpad Potions

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Finder > Preferences > Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder > Preferences > Show wraning before changing an extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder > Preferences > Show wraning before removing from iCloud Drive
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false

# Finder > View > As List
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder > View > Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder > View
defaults write com.apple.finder AppleShowAllFiles -string YES

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Others:

# Completely Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Kill affected apps
for app in "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done

echo "macOS Settings...Done!"

echo "Installing Brew favorites..."
brew install imagemagick
brew install yarn
brew install mas
brew tap cjbassi/ytop
brew install ytop
brew install ncdu
brew install fd
brew install trash
brew install wget
brew install mackup
brew install nmap
brew install tcping
brew install awscli
brew install git
brew install python
brew install curl
brew install stats

echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing Browsers..."
brew install --cask google-chrome
brew install --cask firefox

echo "Installing Dev apps..."
brew install --cask powershell
brew install --cask visual-studio-code
brew install terraform
brew install vagrant

echo "Installing Media apps..."
brew cask install iina
brew cask install spotify
brew install ffmpeg
brew install youtube-dl

echo "Installing Productivity apps..."
brew install --cask iterm2
brew install --cask spectacle
brew install --cask 1password
brew install --cask alfred
brew install --cask docker
brew install --cask royal-tsx
brew install --cask dropbox
brew install --cask google-backup-and-sync
brew install --cask messenger
brew install --cask whatsapp
brew install --cask skype
brew install --cask zoomus
brew install --cask slack
brew install --cask sourcetree
brew install --cask tunnelblick
brew install --cask vanilla
brew install --cask microsoft-office
brew install --cask deepl


echo "Installing Apps from the App Store..."
mas install 937984704 # Amphetamine
mas install 1274495053 # Microsoft To Do
mas install 485812721 # TweetDeck
mas install 1450640351 # Lightweight PDF

echo "Setting ZSH highlighting & autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Clean things up
brew update && \
brew outdated && \
brew cleanup && 
brew doctor

echo "Everything is ready. Enjoy your new Mac!"
echo "Obs. Note that some of these changes require a logout/restart to take effect."

# Apps missing: 
# Need to automate: Screenshot folder, ssh keys, git-ssh, mackup config