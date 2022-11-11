#!/bin/bash

# get hostname on Mac

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

get_hostname() {
    printf "\nGet hostname on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started getting hostname at $(date)"

    hostName=$(scutil --get HostName)
    echo "The hostname is: $hostName"
    tput setaf 2; echo "Successfully got hostname."; tput sgr0

    end=$(date +%s)
    echo "Finished getting hostname at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

get_hostname
