#!/bin/bash

# remove youtube-dl cache on Mac

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating system:\n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

check_youtube-dl() {
    echo "Started checking youtube-dl at $(date)"

    which -s youtube-dl
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "youtube-dl is installed."; tput sgr0

        echo "Finished checking youtube-dl at $(date)"
        echo ""
    else 
        tput setaf 1; echo "youtube-dl is not installed."; tput sgr0

        echo "Finished checking youtube-dl at $(date)"
        echo ""

        exit 1
    fi
}

remove_youtube-dl-cache() {
    printf "\nRemove youtube-dl cache on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started removing youtube-dl cache at $(date)"

    youtube-dl --rm-cache-dir
    tput setaf 2; echo "Successfully removed youtube-dl cache."; tput sgr0

    end=$(date +%s)
    echo "Finished removing youtube-dl cache at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

remove_youtube-dl-cache
