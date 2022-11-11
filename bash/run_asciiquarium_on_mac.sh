#!/bin/bash

# run asciiquarium on Mac

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

check_asciiquarium() {
    echo "Started checking asciiquarium at $(date)"

    which -s asciiquarium
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "asciiquarium is installed."; tput sgr0

        echo "Finished checking asciiquarium at $(date)"
        echo ""
    else    
        tput setaf 1; echo "asciiquarium is not installed."; tput sgr0

        echo "Finished checking asciiquarium at $(date)"
        echo ""

        exit 1
    fi
}

run_asciiquarium() {
    printf "\nRun asciiquarium on Mac.\n\n"
    
    check_os_for_mac
    check_asciiquarium

    start=$(date +%s)
    echo "Started running asciiquarium at $(date)"

    echo "Press \"control\" and \"C\" keys when you want to quit asciiquarium"
    sleep 5
    asciiquarium
    tput setaf 2; echo "Successfully ran asciiquarium."; tput sgr0

    end=$(date +%s)
    echo "Finished running asciiquarium at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

run_asciiquarium
