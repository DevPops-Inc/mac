#!/bin/bash

# run rainbow date and time on Mac

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

run_rainbow() {
    printf "\nRun rainbow date and time on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started running rainbow date and time at $(date)"

    echo "Press \"control\" and \"C\" when you're ready to quit rainbow date and time."

    while true; do echo "$(date '+%D %T' | toilet -f term -F border --gay)"; sleep 1; done

    tput setaf 2; echo "Successfully ran rainbow date and time."; tput sgr0

    end=$(date +%s)
    echo "Finished running rainbow date and time at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

run_rainbow
