#!/bin/bash
set -e

# delete all DS_Store files from Mac

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

delete_dsstore_files() {
    printf "\nDelete all DS_Store files from Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started deleting DS_Store files at $(date)"

    find / -name “.DS_Store” -depth -exec rm {} \;

    tput setaf 2; echo "Successfully deleted DS_Store files."; tput sgr0

    end=$(date +%s)
    echo "Finished deleting DS_Store files at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

delete_dsstore_files
