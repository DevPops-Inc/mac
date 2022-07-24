#!/bin/bash

# watch Star Wars with telnet on Mac

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

check_telnet() {
    echo "Started checking Telnet at $(date)"

    which -s telnet
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "Telnet is installed."; tput sgr0
        
        echo "Finished checking Telnet at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Telnet is not installed."; tput sgr0

        echo "Finished checking Telnet at $(date)"
        echo ""

        exit 1
    fi
}

watch_starwars_with_telnet() {
    printf "\nWatch Star Wars with Telnet on Mac.\n\n"
    
    check_os_for_mac
    check_telnet

    start=$(date +%s)
    echo "Started watching Star Wars at $(date)"

    telnet towel.blinkenlights.nl
    tput setaf 2; echo "Successfully watched Star Wars."; tput sgr0

    end=$(date +%s)
    echo "Finished watching Star Wars at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

watch_starwars_with_telnet
