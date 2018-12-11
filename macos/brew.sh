#!/bin/bash

if ! [ -x "$(command -v brew)" ]; 
then
        printf "\n" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
else
        echo "brew already installed!"
fi


brew update
brew upgrade

# Taps
brew tap caskroom/versions
brew tap caskroom/cask
brew tap caskroom/fonts

# Main tools
brew install zsh
brew install git
brew install tree
brew install wget
brew install brew-cask-completion
brew install source-highlight
brew install cmake

# Java
brew cask install java
brew cask install java8

# Applications
brew cask install iterm2
brew cask install visual-studio-code
brew cask install transmission
brew cask install smcfancontrol
brew cask install dropbox
brew cask install google-chrome
brew cask install mplayerx
brew cask install vlc
brew cask install cheatsheet

# Fonts
brew cask install font-powerline-symbols

brew cleanup