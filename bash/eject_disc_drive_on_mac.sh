#!/bin/bash
set -e

# eject disc drive on Mac

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

eject_disc_drive() {
    printf "\nEject disc drive on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started ejecting disc drive at $(date)"

    drutil tray eject

    tput setaf 2; echo "Successfully ejected disc drive."; tput sgr0

    end=$(date +%s)
    echo "Finished ejecting disc drive at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration seconds"
    echo ""
}

eject_disc_drive
