skip_global_compinit=1

export EDITOR=$(which nano)
export ZSH=$HOME/.oh-my-zsh

# dotfiles
export DOTFILES_DIR=$HOME/.dotfiles
source $HOME/.dotfiles/.aliases
source $HOME/.dotfiles/.functions

# OS specific exports
if [ "$(uname -s)" = "Darwin" ]; then 
    source $DOTFILES_DIR/macos/.exports
else
    source $DOTFILES_DIR/ubuntu/.exports
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
