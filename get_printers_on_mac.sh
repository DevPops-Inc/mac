#!/bin/bash

# get printers on Mac

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

get_printers() {
    printf "\nGet printers on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started getting printers at $(date)"

    printers=$(lpstat -p)
    echo "The printers are: $printers"

    tput setaf 2; echo "Successfully got printers."; tput sgr0

    end=$(date +%s)
    echo "Finished getting printer at $(date)"
    echo ""
}

get_printers
