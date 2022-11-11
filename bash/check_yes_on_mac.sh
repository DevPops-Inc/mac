#!/bin/bash

# check yes on Mac

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

check_yes() {
    printf "\nCheck yes on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started checking yes at $(date)"

    which -s yes
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "yes is installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking yes at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
    else 
        tput setaf 1; echo "yes is not installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking yes at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""

        exit 1
    fi
}

check_yes
