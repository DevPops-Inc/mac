#!/bin/bash

# check colorama on Mac

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

        exit 1
    fi
}

check_colorama() {
    printf "\nCheck colorama on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started checking colorama at $(date)"

    which -s colorama
    if [[ $? != 0 ]]; then
        tput setaf 1; echo "colorama is not installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking colorama at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""

        exit 1
    else 
        tput setaf 2; echo "colorama is installed."; tput sgr0
        colorama 

        end=$(date +%s)
        echo "Finished checking colorama at $(date)"
        
        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
    fi
}

check_colorama
