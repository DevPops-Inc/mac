#!/bin/bash

# check Node on Mac

check_os_for_mac() {

    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then
        tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0
        echo "Finished checking operating system at $(date)"
        echo ""
    else
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0
        echo ""
        exit 1
    fi
}

check_node() {
    printf "\nCheck Node on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started checking Node at $(date)"

    if [ -d $(which node) ]; echo $? == 0 &>/dev/null
    then
        tput setaf 2; echo "Node is installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking Node at $(date)"
        
        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
    else
        tput setaf 1; echo "Node is not installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking Node at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"

        exit 1
    fi
}

check_node
