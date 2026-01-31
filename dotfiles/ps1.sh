# Terminal Prompt - should be POSIX-compliant.

#----- ANSI Colors -----
  RESET=$(tput sgr0)
   BOLD=$(tput bold)

    RED=$(tput setaf 1)
  GREEN=$(tput setaf 2)
 YELLOW=$(tput setaf 3)
   BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
   CYAN=$(tput setaf 6)
  WHITE=$(tput setaf 7)
#-----------------------

_prompt() {
    _exit_code=${?}
    if [ ${_exit_code} -eq 0 ]; then
        _status_color="${GREEN}"
        _status_mark='✔'
    else
        _status_color="${RED}"
        _status_mark='✘'
    fi

    _last_command_status=$(printf ' | %s%s %d%s' "${_status_color}" "${_status_mark}" "${_exit_code}" "${RESET}")

    _time=$(printf '%s%s%s' "${BLUE}" "$(date +%H:%M:%S)" "${RESET}")

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

    _dir=$(printf ' | %s📂 %s%s' "${CYAN}" "${_dirstr}" "${RESET}")

    _parse_branch=$(git symbolic-ref -q --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    if [ ! -z "${_parse_branch}" ]; then
        _git_branch=$(printf ' | %s⎇ %s%s' "${MAGENTA}" "${_parse_branch}" "${RESET}")
    fi

    _prompt_trail='∟❱❱'

    printf '\n[ %s%s%s%s ]\n %s ' "${_time}" "${_last_command_status}" "${_dir}" "${_git_branch}" "${_prompt_trail}"
}

export PS1="\$(_prompt)"
