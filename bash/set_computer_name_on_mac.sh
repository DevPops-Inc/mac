#!/bin/bash

# set computer name on Mac

# you can run this script with: sudo ./set_computer_name_on_mac.sh < computer name > 

computerName=$1

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

get_computer_name() {
    if [ -z $computerName ]; then 
        oldComputerName=$(scutil --get ComputerName)
        echo "The computer name is: $oldComputerName"
        echo ""

        read -p "Please type the new computer name and press \"return\" key (Example: Dev-MBP): " computerName

        echo ""
    else 
        echo $computerName &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameter(s) at $(date)"
    valid="true"

    echo "Parameter(s):"
    echo "---------------------------"
    echo "computerName: $computerName"
    echo "---------------------------"

    if [ -z $computerName ]; then 
        tput setaf 1; echo "computerName is not set."; tput sgr0
        valid="false"
    fi

    if [ $valid == "true" ]; then 
        tput setaf 2; echo "All parameter check(s) passed."; tput sgr0

        echo "Finished checking parameter(s) at $(date)"
        echo ""
    else 
        tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0

        echo "Finished checking parameter(s) at $(date)"
        echo ""

        exit 1
    fi
}

set_computer_name() {
    printf "\nSet computer name on Mac.\n\n"
    check_os_for_mac

    get_computer_name
    check_parameters

    start=$(date +%s)
    echo "Started setting computer name at $(date)"

    scutil --set ComputerName $computerName
    echo "The new computer name is: $computerName"
    tput setaf 2; echo "Successfully set computer name."; tput sgr0

    end=$(date +%s)
    echo "Finished setting computer name at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

set_computer_name
