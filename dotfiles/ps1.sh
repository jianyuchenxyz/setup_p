# Terminal Prompt - should be POSIX-compliant.

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

    _prompt_trail='╰─❱❱'

    printf '\n ╭─【%s%s%s%s 】\n %s ' "${_time}" "${_last_command_status}" "${_dir}" "${_git_branch}" "${_prompt_trail}"
}

export PS1="\$(_prompt)"
