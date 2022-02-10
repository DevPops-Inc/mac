#!/bin/bash

# check argcomplete on Mac

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

check_argcomplete() {
    printf "\nCheck argcomplete on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started checking argcomplete at $(date)"

    which -s argcomplete
    if [[ $? != 0 ]]; then 
        tput setaf 1; echo "argcomplete is not installed."; tput sgr0
        
        end=$(date +%s)
        echo "Finished checking argcomplete at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
    else 
        tput setaf 2; echo "argcomplete is installed."; tput sgr0
        argcomplete --version

        end=$(date +%s)
        echo "Finished checking argcomplete at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""

        exit 0
    fi
}

check_argcomplete
