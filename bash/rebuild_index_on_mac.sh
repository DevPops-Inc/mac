#!/bin/bash
set -e

# rebuild index on Mac
# run this script as root: sudo ./rebuild_index_on_mac.sh

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

rebuild_index() {
    printf "\nRebuild index on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started rebuilding index at $(date)"

    mdutil -i on /
    tput setaf 2; echo "Successfully rebuilt index."; tput sgr0

    end=$(date +%s)
    echo "Finished rebuilding index at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

rebuild_index
