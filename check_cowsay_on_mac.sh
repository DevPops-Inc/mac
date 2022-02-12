#!/bin/bash

# check cowsay on Mac

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

check_cowsay() {
    printf "\nCheck cowsay on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started checking cowsay at $(date)"

    which -s cowsay
    if [[ $? != 0 ]]; then  
        tput setaf 1; echo "cowsay is not installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking cowsay at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""

        exit 1
    else 
        tput setaf 2; echo "cowsay is installed."; tput sgr0
        cowsay "cowsay is installed."

        end=$(date +%s)
        echo "Finished checking cowsay at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
    fi
}

check_cowsay
