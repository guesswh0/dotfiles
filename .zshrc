ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ORDER=()
SPACESHIP_PROMPT_ADD_NEWLINE=false

SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_COLOR=white

SPACESHIP_BATTERY_SHOW=false

ENABLE_CORRECTION="true"

plugins=(
  git
  command-not-found
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
source $HOME/.functions

# Locale
export LANG=eu_US.UTF-8
export LC_ALL=en_US.UTF-8
export NLS_LANG=AMERICAN_AMERICA.AL32UTF8
