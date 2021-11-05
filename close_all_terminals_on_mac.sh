#!/bin/bash

# close all Terminals on Mac

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

close_terminals() { 
    printf "\nClose All Terminals on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started closing terminals at $(date)"
    
    ps x | grep Terminal.app | grep -v grep | awk '{ system("kill -9 " $1) }'

    tput setaf 2; echo "Successfully closed all terminals."; tput sgr0
    
    end=$(date +%s)
    echo "Finished closing terminals at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
}

close_terminals
