#!/bin/bash
set -e

# get computer name on Mac

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

get_computer_name() {
    printf "\nGet computer name on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started getting computer name at $(date)"

    computerName=$(scutil --get ComputerName)
    echo "Computer name is: $computerName"

    tput setaf 2; echo "Successfully got computer name."; tput sgr0

    end=$(date +%s)
    echo "Finished getting computer name at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

get_computer_name
