# User specific profile for interactive zsh shells.

ZSH_THEME="custom"
DEFAULT_USER="$(whoami)"

plugins=(
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
  docker
)

source $ZSH/oh-my-zsh.sh
