#!/bin/bash

# enable SSH on Mac

# prompt user input

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

        exit 1
    fi
}

enable_ssh() {
    printf "\nEnable SSH on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started enabling SSH at $(date)"

    sudo systemsetup -setremotelogin on
    sudo systemsetup -getremotelogin

    tput setaf 2; echo "Successfully enabled SSH."; tput sgr0

    end=$(date +%s)
    echo "Finished enabling SSH at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

enable_ssh
