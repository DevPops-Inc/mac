#!/bin/bash 

# check OS for Mac

check_os_for_mac() {
    
    printf "\nChecking operating system at $(date)\n"

    if [[ $OSTYPE == 'darwin'* ]]; then
        tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0
        printf "Finished checking operating system at $(date).\n\n"
    else
        tput setaf 1; echo "Sorry but this script only works on Mac."; tput sgr0
        printf "Finished checking operating system at $(date).\n\n"
        exit 1
    fi
}

check_os_for_mac
