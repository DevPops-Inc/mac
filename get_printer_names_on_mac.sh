#!/bin/bash

# get printer names on Mac

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

get_printer_names() {
    printf "\nGet printer names on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started getting printer names at $(date)"   

    printerNames=$(lpstat -p | awk '{print $2}')
    echo "The printer names are: $printerNames"
    
    tput setaf 2; echo "Successfully got printer names."; tput sgr0

    end=$(date +%s)
    echo "Finished getting printer names at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

get_printer_names
