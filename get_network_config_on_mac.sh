#!/bin/bash
set -e

# get network configuration on Mac

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating system:\n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

get_network_config() {
    printf "\nGet network configuration on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started getting network configuration at $(date)"

    ifconfig
    tput setaf 2; echo "Successfully got network configuration."; tput sgr0

    end=$(date +%s)
    echo "Finished getting network configuration at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

get_network_config

