#!/bin/bash

if ! [ -x "$(command -v brew)" ]; 
then
        printf "\n" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
else
        echo "brew already installed!"
fi


brew update
brew upgrade

# Main tools
brew install zsh
brew install git
brew install tree
brew install wget
brew install brew-cask-completion
brew install source-highlight

# Additional utilities
brew install moreutils
brew install coreutils

# Build tools
brew install cmake
brew install pkg-config
brew install readline

# Python
brew install python

# Applications
brew cask install iterm2
brew cask install transmission
brew cask install smcfancontrol
brew cask install dropbox
brew cask install vlc

# Java
brew cask install java

brew cleanup