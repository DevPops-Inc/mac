#!/bin/bash
set -e

# reset dock on Mac

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo "Operating System:\n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

reset_dock() {
    printf "\nReset dock on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started resetting dock at $(date)"

    defaults delete com.apple.dock;
    killall Dock
    tput setaf 2; echo "Successfully reset dock."; tput sgr0

    end=$(date +%s)
    echo "Finished resetting dock at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

reset_dock
