#!/bin/bash

if ! [ -x "$(command -v brew)" ]; 
then
        printf "\n" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
else
        echo "brew already installed!"
fi


brew update
brew upgrade

# Main
brew install zsh
brew install git
brew install tree
brew install brew-cask-completion
brew install source-highlight
brew install nano

brew install cmake
brew install python
brew install python@2
brew install numpy
brew install opencv
brew install dlib

# Taps
brew tap caskroom/versions
brew tap caskroom/cask
brew tap caskroom/fonts

# Java versions
brew cask install java
brew cask install java8
brew cask install java6

# Applications
brew cask install iterm2
brew cask install visual-studio-code
brew cask install transmission
brew cask install smcfancontrol
brew cask install adobe-acrobat-reader
brew cask install dropbox
brew cask install google-chrome
brew cask install skype
brew cask install whatsapp
brew cask install mplayerx
brew cask install cheatsheet
brew cask install pycharm
brew cask install intellij-idea

brew cleanup