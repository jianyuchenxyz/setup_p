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

trailing_two_dirs() {
    if [ $(pwd) = "${HOME}" ]; then
        DIR_STR='~'
    else
        DIR_STR="$(pwd | awk -F '/' '{print $(NF-1), $(NF)}' | sed 's/ /\//')"
    fi

    OLD_IFS=${IFS}
    IFS=""
    printf ' | %s📂 %s%s' "${CYAN}" "${DIR_STR}" "${RESET}"
    IFS=${OLD_IFS}
}

last_command_status() {
    EXIT_CODE=${?}
    if [ ${EXIT_CODE} -eq 0 ]; then
        printf ' | %s✔ %d%s' "${GREEN}" "${EXIT_CODE}" "${RESET}"
        return
    fi

    printf ' | %s✘ %d%s' "${RED}" "${EXIT_CODE}" "${RESET}"
}

parse_git_branch() {
    git rev-parse 2> /dev/null
    if [ ${?} -eq 0 ]; then
        OLD_IFS=${IFS}
        IFS=""
        printf ' | %s⎇ %s%s' "${MAGENTA}" "$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/')" "${RESET}"
        IFS=${OLD_IFS}
    fi
}

export PS1="\n[ "${BLUE}"\t"${RESET}"\$(last_command_status)\$(trailing_two_dirs)\$(parse_git_branch) ]\n ∟❱❱ "
