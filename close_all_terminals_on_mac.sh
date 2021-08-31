#!/bin/bash

# close all Terminals on Mac

check_os_for_mac() {
    
    printf "\nChecking operating system...\n"

    if [[ $OSTYPE == 'darwin'* ]]; then
        tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0
        printf "Finished checking operating system.\n"
    else
        tput setaf 1; echo "Sorry but this script only works on Mac."; tput sgr0
        printf "Finished checking operating system.\n"
        exit 1
    fi
}

close_terminals() { 
    printf "\nClose All Terminals on Mac.\n"
    check_os_for_mac

    echo "Started closing terminals at $(date)"
    start=$(date +%s)

    ps x | grep Terminal.app | grep -v grep | awk '{ system("kill -9 " $1) }'

    tput setaf 2; echo -e "\nFinished closing terminals at $(date)"; tput sgr0
    end=$(date +%s)

    duration=$(( $end - $start ))
    printf "\nTotal execution time: $duration second(s)\n"
}

close_terminals
