My zsh macos/ubuntu *dotfiles*

# Prerequisites:

## Macos

### Software Updates:

    sudo softwareupdate -i -a

### Apple Command Line Tools:

    xcode-select --install

> In case *installation* goes wrong (e.g stuck):

    sudo rm /private/var/db/mds/system/mds.install.lock
    sudo rm /private/var/db/mds/system/mds.lock
    sudo killall -1 installd

## Ubuntu

### Update the apt package index:

    sudo apt-get update

### Install *git* packages:

    sudo apt-get install git

### 


# Installation

### Clone with Git

    git clone https://github.com/guesswh0/dotfiles.git ~/.dotfiles

### Source setup script

    source ~/.dotfiles/setup.sh
