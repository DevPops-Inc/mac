#!/bin/bash
set -e

# check SSH status on Mac

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

check_ssh_status() {
    printf "\nCheck SSH status on Mac.\n\n"
    check_os_for_mac

    echo "Started checking SSH status at $(date)"
    start=$(date +%s)

    sudo systemsetup -getremotelogin

    end=$(date +%s)
    tput setaf 2; echo -e "Finished checking SSH status at $(date)"; tput sgr0

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
}

check_ssh_status
