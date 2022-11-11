#!/bin/bash

# check steam locomotive 

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

check_steam_locomotive() {
    printf "\nCheck steam locomotive on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started checking steam locomotive at $(date)"

    which -s sl
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "Steam locomotive is installed."; tput sgr0
        sl
    else 
        tput setaf 1; echo "Steam locomotive is not installed"; tput sgr0
    fi

    tput setaf 2; echo "Successfully checked steam locomotive."; tput sgr0

    end=$(date +%s)
    echo "Finished checking steam locomotive at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

check_steam_locomotive
