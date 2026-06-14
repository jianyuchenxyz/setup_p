# ===================
# CUSTOM
# ===================
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export LESSHISTFILE=-  # Do not create .lesshst while invoking less.

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

# Start X Server immediately after login
# still buggy
# startx

