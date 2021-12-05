#!/bin/bash
set -e

# find gateway address on Mac 

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

find_gateway_address() {
    printf "\nFind gateway address on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started finding gateway address at $(date)"

    netstat -nr | grep default

    tput setaf 2; echo "Successfully found gateway address."; tput sgr0

    end=$(date +%s)
    echo "Finished finding gateway address at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

find_gateway_address
