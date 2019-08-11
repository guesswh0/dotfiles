ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  host          # Hostname section
  venv          # Python venv section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  package       # Package version
  docker        # Docker section
  # pyenv
  exec_time     # Execution time
  exit_code     # Show exit code for last command
  line_sep      # Line break
)

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_COLOR=white
SPACESHIP_BATTERY_SHOW=false 

# GIT
# SPACESHIP_GIT_BRANCH_COLOR=22

# DIR
SPACESHIP_DIR_PREFIX=''
SPACESHIP_DIR_TRUNC='1'

# VENV
# SPACESHIP_VENV_SHOW=false
SPACESHIP_VENV_PREFIX="("
SPACESHIP_VENV_SUFFIX=") "
SPACESHIP_VENV_COLOR=yellow


# PYENV
SPACESHIP_PYENV_PREFIX=""
SPACESHIP_PYENV_SUFFIX=" "
SPACESHIP_PYENV_SYMBOL=""

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

ENABLE_CORRECTION=false

plugins=(
  pyenv
  pip
  python
  command-not-found
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

source $ZSH/oh-my-zsh.sh

# pyenv shims
# if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mc mc
