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
brew tap homebrew/cask-versions

brew install openjdk@11
sudo ln -sfn $(brew --prefix)/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk

# brew cask install --appdir="/Applications" intellij-idea
# brew cask install --appdir="/Applications" robo-3t
# brew cask install --appdir="~/Applications" cleanmymac
# brew cask install --appdir="~/Applications" charles
brew install --cask --appdir="/Applications" docker
# brew cask install --appdir="/Applications" slack
# brew cask install --appdir="/Applications" microsoft-teams
# brew cask install --appdir="/Applications" kafka-tool
brew install --cask --appdir="/Applications" postman

brew install jenv
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.extra
echo 'eval "$(jenv init -)"' >> ~/.extra


brew install maven
# brew install postgres

# brew install node

# brew cask install --appdir="~/Applications" calibre
