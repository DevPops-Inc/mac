#!/bin/bash
set -e

# check SSH status on Mac

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

check_ssh_status() {
    printf "\nCheck SSH status on Mac.\n"
    check_os_for_mac

    echo "Started checking SSH status at $(date)"
    start=$(date +%s)

    sudo systemsetup -getremotelogin

    tput setaf 2; echo -e "Finished checking SSH status at $(date)"; tput sgr0
    end=$(date +%s)

    duration=$(( $end - $start ))
    printf "\nTotal execution time: $duration second(s)\n"
}

check_ssh_status
