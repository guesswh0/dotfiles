skip_global_compinit=1

export DOTFILES_DIR=$HOME/.dotfiles
export ZSH=$HOME/.oh-my-zsh
export VISUAL=vim
export EDITOR="$VISUAL"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Locale
export LANG=eu_US.UTF-8
export LC_ALL=en_US.UTF-8
export NLS_LANG=AMERICAN_AMERICA.AL32UTF8

# OS specific exports
if [ "$(uname -s)" = "Darwin" ]; then 
    source $DOTFILES_DIR/macos/.exports
    source $DOTFILES_DIR/macos/.aliases
else
    source $DOTFILES_DIR/ubuntu/.exports
    source $DOTFILES_DIR/ubuntu/.aliases
fi