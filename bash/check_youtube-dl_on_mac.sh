#!/bin/bash

# install YouTube Downloader with PIP on Mac

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating System:\n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 2; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

check_youtube-dl() {
    printf "\nCheck youtube-dl on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started checking youtube-dl at $(date)"
    
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "youtube-dl is installed."; tput sgr0
        youtube-dl --version

        end=$(date +%s)
        echo "Finished checking youtube-dl at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
    else 
        tput setaf 1; echo "youtube-dl is not installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking youtube-dl at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
    fi
}

check_youtube-dl
