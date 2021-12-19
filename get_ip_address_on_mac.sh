#!/bin/bash 

# get IP address on Mac

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

get_ip_address() {
    printf "\nGet IP address on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started getting IP address at $(date)"

    ifconfig | grep -w 'inet' 

    tput setaf 2; echo "Successfully got IP address."; tput sgr0

    end=$(date +%s)
    echo "Finished getting IP address at $(date)"
    
    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

get_ip_address
