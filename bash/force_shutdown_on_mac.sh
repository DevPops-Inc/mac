#!/bin/bash
set -e

# force shutdown on Mac

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

force_shutdown() {
    printf "\nForce shutdown on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started forcing shutdown at $(date)"

    shutdown –h now    
    tput setaf 2; echo "Successfully forced shutdown."; tput sgr0

    end=$(date +%s)
    echo "Finished forcing shutdown at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

force_shutdown
