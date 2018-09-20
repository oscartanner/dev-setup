#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Install Cask
# brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Already installed in brew.sh
brew cask install --appdir="~/Applications" java
# brew cask install --appdir="~/Applications" Caskroom/versions/intellij-idea-ce
brew cask install --appdir="~/Applications" android-studio

# Not working, better let Android Studio install it
# brew install android-sdk

# Remove outdated versions from the cellar.
brew cleanup

# Adding ANDROID_HOME to PATH. Android SDK will be installed in this path when you first open Android Studio
LINE='PATH="export ANDROID_HOME="$HOME/Library/Android/sdk"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

LINE='PATH="export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra
