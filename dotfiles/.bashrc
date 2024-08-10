# ===================
# CUSTOM
# ===================

# PATH
export PATH=$PATH:~/.local/bin  # epy

# NeoVim
export EDITOR="nvim"
alias vi="/usr/bin/nvim"

# Git
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git log --all --decorate --oneline --graph"

# Applications
alias nb="newsboat"
alias ff="nohup firefox > /dev/null 2>&1 &"
alias oo="nohup okular > /dev/null 2>&1 &"

# PS1
RESET=$(tput sgr0)
BOLD=$(tput bold)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)

PS1=\
'\[$RESET\]'\
'\[$BOLD\][ '\
'\[$RED\]\t '\
'\[$WHITE\]| '\
'\[$CYAN\]\W'\
'\[$GREEN\]$(__git_ps1) '\
'\[$WHITE\]]'\
'\[$RESET\]$ '

# $PS1 color code description
# PS1=\
#   '\[$RESET\]'\   # reset all previous color codes
#   '\[$BOLD\][ '\  # set bold for all characters, and add opening '['
#   '\[$RED\]\t '\  # set red for time '\t'
#   '\[$WHITE\]| '\ # set white for pipe '|'
#   '\[$CYAN\]\W'\  # set cyan for trailing directory '\W'
#   '\[$GREEN\]$(__git_ps1) '\ # set green if current directory is a git repo
#   '\[$WHITE\]]'\  # set white for closing ']'
#   '\[$RESET\]$ '  # reset all previous color codes and output '$ '

# Start X Server immediately after login
# still buggy
# startx

