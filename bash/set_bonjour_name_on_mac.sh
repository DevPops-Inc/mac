#!/bin/bash
set -e

# set Bonjour name on Mac

# you can run this script with: ./set_bonjour_name_on_mac.sh < new Bonjour name > 

newBonjourName=$1

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

get_bonjour_name() {
    if [ -z $newBonjourName ]; then
        oldBonjourName=$(scutil --get LocalHostName)
        echo "The current Bonjour name is: $oldBonjourName"
        echo ""

        read -p "Please type the new Bonjour name and press \"return\" key (Example: Dev-MBP): " newBonjourName

        echo ""
    else 
        echo $newBonjourName &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameters at $(date)"
    valid="true"

    echo "Parameters:"
    echo "-------------------------------"
    echo "newBonjourName: $newBonjourName"
    echo "-------------------------------"

    if [ -z $newBonjourName ]; then 
        tput setaf 1; echo "newBonjourName is not set."; tput sgr0
        valid="false"
    fi

    if [ $valid == "true" ]; then 
        tput setaf 2; echo "All parameter checks passed."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

set_bonjour_name() {
    printf "\nSet Bonjour name on Mac.\n\n"
    check_os_for_mac

    get_bonjour_name
    check_parameters

    start=$(date +%s)
    echo "Started setting Bonjour name at $(date)"

    scutil --set LocalHostName $newBonjourName
    echo "The new Bonjour name is: $newBonjourName"
    tput setaf 2; echo "Successfully set Bonjour name."; tput sgr0

    end=$(date +%s)
    echo "Finished setting Bonjour name at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

set_bonjour_name
