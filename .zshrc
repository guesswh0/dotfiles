# User specific profile for interactive zsh shells.

ZSH_THEME="agnoster"
DEFAULT_USER="$(whoami)"

plugins=(
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
  docker
)

source $ZSH/oh-my-zsh.sh

prompt_dir() {
  prompt_segment cyan $CURRENT_FG '\uF115|%2~'
}