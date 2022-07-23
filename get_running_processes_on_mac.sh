#!/bin/bash

# get running processes on Mac

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating System:\n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

get_running_processes() {
    printf "\nGet running processes on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started getting running processes at $(date)"

    tput setaf 4; echo "Press \"control\" and \"C\" key to quit running processes."; tput sgr0
    
    sleep 3
    top
    tput setaf 2; echo "Successfully got running processes."; tput sgr0

    end=$(date +%s)
    echo "Finished getting running processes at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
}

get_running_processes
