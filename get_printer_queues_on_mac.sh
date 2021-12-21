#!/bin/bash

# get printer queues on Mac

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

get_printer_queues() {
    printf "\nGet printer queues on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started getting printer queues at $(date)"

    printerQueues=$(lpstat -p | awk '{print $2}'| xargs -n1 lpq -P)
    echo "The printer queues are: $printerQueues"

    tput setaf 2; echo "Successfully got printer queues."; tput sgr0

    end=$(date +%s)
    echo "Finished gettting printer queues at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

get_printer_queues
