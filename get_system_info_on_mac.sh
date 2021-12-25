#!/bin/bash

# get system info on Mac 

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

get_system_info() {
    printf "\nGet system info on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started getting system info at $(date)"

    system_profiler

    tput setaf 2; echo "Successfully got system info."; tput sgr0

    end=$(date +%s)
    echo "Finished getting system info at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

get_system_info
