#!/bin/bash
set -e

# kill dock on Mac

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo "Operating system:\n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

kill_dock() {
    printf "\nKill dock on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started killing dock at $(date)"

    defaults delete com.apple.dock;
    killall Dock
    tput setaf 2; echo "Successfully killed dock."; tput sgr0

    end=$(date +%s)
    echo "Finished killing dock at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

kill_dock
