#!/bin/bash
set -e

# get unique ID on Mac

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

get_unique_id() {
    printf "\nGet unique ID on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started getting unqiue ID at $(date)"

    echo "The unique ID is: "
    id

    tput setaf 2; echo "Successfully got unique ID."; tput sgr0

    end=$(date +%s)
    echo "Finished getting unique ID at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

get_unique_id
