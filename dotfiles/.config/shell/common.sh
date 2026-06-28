#-----------------------------------------------------------
# Helper functions
#-----------------------------------------------------------
# path_append appends a path segment to $PATH and handles duplicates.
path_append() {
    if [ -n "${1}" ]; then
        case ":${PATH}:" in
            *:"${1}":*)
                # Path exists, no-op
                ;;
            *)
                # Path does not exist, append
                PATH="${PATH}:${1}"
                ;;
        esac
    fi
}

# create_hush_login creates "$HOME/.hushlogin" if it does not exist.
create_hushlogin() {
    if [ ! -f "${HOME}/.hushlogin" ]; then
        touch "${HOME}/.hushlogin"
    fi
}

#-----------------------------------------------------------
# Cross-Desktop Group (XDG) compliant directories
#-----------------------------------------------------------
XDG_CONFIG_HOME="${HOME}/.config"; export XDG_CONFIG_HOME
XDG_DATA_HOME="${HOME}/.local/share"; export XDG_DATA_HOME
XDG_BIN_HOME="${HOME}/.local/bin"; export XDG_BIN_HOME
XDG_STATE_HOME="${HOME}/.local/state"; export XDG_STATE_HOME
XDG_CACHE_HOME="${HOME}/.cache"; export XDG_CACHE_HOME

#-----------------------------------------------------------
# $PATH additions
#-----------------------------------------------------------
path_append "${XDG_CONFIG_HOME}"
path_append "${XDG_DATA_HOME}"
path_append "${XDG_BIN_HOME}"
path_append "${XDG_STATE_HOME}"
path_append "${XDG_CACHE_HOME}"
export PATH

#-----------------------------------------------------------
# Aliases
#-----------------------------------------------------------
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git log --all --decorate --oneline --graph"
alias gs="git status"
alias ls="ls --color=auto"
alias sc="staticcheck"
alias vi="${XDG_BIN_HOME}/nvim-0_11_4.appimage"  # v0.11.4

#-----------------------------------------------------------
# Miscellanous
#-----------------------------------------------------------
# Mute system login and MOTD messages.
create_hushlogin

# Disable terminal bell.
bind 'set bell-style none'

# Extend command history limit.
HISTSIZE=10000; export HISTSIZE

# Prevent the creation of .lesshst on less invocation.
LESSHISTFILE=-; export LESSHISTFILE

#----------------------------------------------------------
# $PS1 prompt - should be POSIX-compliant.
#----------------------------------------------------------

#------- ANSI Colors -------
  _c_reset=$(tput sgr0)
   _c_bold=$(tput bold)

    _c_red=$(tput setaf 1)
  _c_green=$(tput setaf 2)
 _c_yellow=$(tput setaf 3)
   _c_blue=$(tput setaf 4)
_c_magenta=$(tput setaf 5)
   _c_cyan=$(tput setaf 6)
  _c_white=$(tput setaf 7)
#---------------------------

_prompt() {
    _exit_code=${?}
    if [ ${_exit_code} -eq 0 ]; then
        _status_color="${_c_green}"
        _status_mark='✔'
    else
        _status_color="${_c_red}"
        _status_mark='✘'
    fi

    _last_command_status=$(printf ' | %s%s %d%s' "${_status_color}" "${_status_mark}" "${_exit_code}" "${_c_reset}")

    _time=$(printf '%s%s%s' "${_c_blue}" "$(date +%H:%M:%S)" "${_c_reset}")

    _pwd="$(pwd)"
    if [ "${_pwd}" = "${HOME}" ]; then
        _dirstr='~'
    else
        # Return the path without the last component.
        _tmpdir="${_pwd%/*}"

        # Remove the longest match followed by a "/", and concatenate
        # with the last component.
        _dirstr="${_tmpdir##*/}/${_pwd##*/}"
    fi

    _dir=$(printf ' | %s📂 %s%s' "${_c_cyan}" "${_dirstr}" "${_c_reset}")

    _parse_branch=$(git symbolic-ref -q --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    if [ ! -z "${_parse_branch}" ]; then
        _git_branch=$(printf ' | %sㇳ%s%s' "${_c_magenta}" "${_parse_branch}" "${_c_reset}")
    fi

    _prompt_trail='╰──❱❱'

    printf '\n╭─[ %s%s%s%s ]\n%s ' "${_time}" "${_last_command_status}" "${_dir}" "${_git_branch}" "${_prompt_trail}"
}

PS1="\$(_prompt)"
