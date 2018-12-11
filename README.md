My zsh macos/ubuntu dotfiles 

## Install

### Apple Command Line Tools:

    sudo softwareupdate -i -a
    xcode-select --install

If something goes wrong with installation of #Command Line Tools:

    sudo rm /private/var/db/mds/system/mds.install.lock
    sudo rm /private/var/db/mds/system/mds.lock
    sudo killall -1 installd


### Clone with Git

    git clone https://github.com/guesswh0/dotfiles.git ~/.dotfiles
    source ~/.dotfiles/setup.sh
