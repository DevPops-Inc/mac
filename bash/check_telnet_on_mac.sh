#!/bin/bash
set -e 

# check telnet on Mac

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
    printf "\nCheck telnet on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s) 
    echo "Started checking Telnet at $(date)"

    if which -s telnet; then 
        tput setaf 2; echo "Telnet is installed."; tput sgr0
        
        end=$(date +%s)
        echo "Finished checking Telnet at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
    else 
        tput setaf 1; echo "Telnet is not installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking Telnet at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""

        exit 1
    fi
}

check_telnet
