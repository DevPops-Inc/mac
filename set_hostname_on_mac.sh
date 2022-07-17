#!/bin/bash
set -e

# set hostname on Mac

# you can run this script with: ./set_hostname_on_mac.sh < new hostname >

hostName=$1

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

get_hostname() {
    if [ -z $hostName ]; then
        oldHostName=$(scutil --get HostName)
        echo "The current hostname is: $oldHostName"
        echo ""

        read -p "Please type the new hostname and press \"return\" key (Example: Dev-MBP): " hostName

        echo ""
    else 
        echo $hostName &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameters at $(date)"
    valid="true"

    echo "Parameters:"
    echo "-------------------"
    echo "hostName: $hostName"
    echo "-------------------"

    if [ -z $hostName ]; then 
        tput setaf 1; echo "hostName is not set."; tput sgr0
        valid="false"
    fi

    if [ $valid == "true" ]; then
        tput setaf 2; echo "All parameter checks passed."; tput sgr0

        echo "Finished checking parameters at $(date)"
        echo ""
    else 
        tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0

        echo "Finished checking parameters at $(date)"
        echo ""

        exit 1
    fi
}

set_hostname() {
    printf "\nSet hostname on Mac.\n\n"
    check_os_for_mac

    get_hostname
    check_parameters

    start=$(date +%s)
    echo "Started setting hostname at $(date)"

    scutil --set HostName $hostName
    newHostName=$(scutil --get HostName)
    echo "The new hostname is: $newHostName"
    tput setaf 2; echo "Successfully set new hostname."; tput sgr0

    end=$(date +%s)
    echo "Finished setting hostname at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

set_hostname
