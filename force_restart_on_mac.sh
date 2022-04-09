#!/bin/bash
set -e

# force restart on Mac

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then
        tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only works on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

force_restart() {
    printf "\nForce restart on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started forcing restart at $(date)"

    shutdown –r now
    tput setaf 2; echo "Successfully forced restart."; tput sgr0

    end=$(date +%s)
    echo "Finished forcing restart at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

force_restart
