
# Terminal Prompt - should be POSIX-compliant.

#----- ANSI Colors -----
RESET="\001\e[0m\002"

RED="\001\e[91m\002"
GREEN="\001\e[92m\002"
YELLOW="\001\e[93m\002"
BLUE="\001\e[94m\002"
MAGENTA="\001\e[95m\002"
CYAN="\001\e[96m\002"
WHITE="\001\e[97m\002"
#-----------------------

last_command_status() {
    printf " | "${YELLOW}"\$?: ${?}"${RESET}""
}

parse_git_branch() {
    git rev-parse 2> /dev/null
    if [ ${?} -eq 0 ]; then
        OLD_IFS=${IFS}
        IFS=""
        printf " | "${GREEN}"⎇ $(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/')"${RESET}""
        IFS=${OLD_IFS}
    fi
}

export PS1="\n[ "${RED}"\t"${RESET}" | "${CYAN}"📂 \W"${RESET}"\$(last_command_status)\$(parse_git_branch) ]\n❱❱ "
