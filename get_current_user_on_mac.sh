#!/bin/bash
set -e

# get current user on Mac

check_os_for_mac() {
    
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    fi
}

get_current_user() {
    printf "\nGet current user on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started getting current user at $(date)"

    currentUser=$(whoami)
    echo "The current user is: $currentUser"

    tput setaf 2; echo "Successfully got current user."; tput sgr0

    end=$(date +%s)
    echo "Finished getting current user at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

get_current_user
