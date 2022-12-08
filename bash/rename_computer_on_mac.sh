#!/bin/bash
set -e

# rename computer on Mac

# you can run this script with: ./rename_computer_on_mac.sh < new computer name >

newComputerName=$1

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
    if [ -z $newComputerName ]; then 
        read -p "Please type the new computer name and press \"return\" key (Example: Dev-Mac): " newComputerName

        echo ""
    else 
        echo $newComputerName &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameter(s) at $(date)"
    valid="true"

    echo "Parameter(s):"
    echo "---------------------------------"
    echo "newComputerName: $newComputerName"
    echo "---------------------------------"

    if [ -z $newComputerName ]; then 
        tput setaf 1; echo "newComputerName is not set."; tput sgr0
        valid="false"
    fi

    if [ $valid == "true" ]; then 
        tput setaf 2; echo "All parameter check(s) passed."; tput sgr0

        echo "Finished checking paramaters at $(date)"
        echo ""
    else 
        tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0

        echo "Finished checking parameter(s) at $(date)"
        echo ""

        exit 1
    fi
}

rename_computer() {
    printf "\nRename computer on Mac.\n\n"
    check_os_for_mac

    get_computer_name
    check_parameters

    start=$(date +%s)
    echo "Started renaming computer at $(date)"

    echo "The computer name is: $(scutil --get ComputerName)"
    scutil --set ComputerName $newComputerName

    tput setaf 2; echo "Successfully renamed computer to: $(scutil --get ComputerName)"; tput sgr0

    end=$(date +%s)
    echo "Finished renaming computer at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

rename_computer
