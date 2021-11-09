#!/bin/bash

# cowthink on Mac

# you can run script with: ./cowthink_on_mac.sh

thought=$1 # you can set the thought here

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

get_thought() {
    if [ -z "$thought" ]; then
        read -p "Please type what you would like for the cow to think and press \"return\" (Example: Grass is delicious): " thought

        echo ""
    else 
        echo "$thought"
    fi
}

check_parameters() {
    echo "Started checking parameters at $(date)"
    valid="true"

    echo "Parameters:" 
    echo "-----------------"
    echo "thought: $thought"
    echo "-----------------"

    if [ -z "$thought" ]; then 
        tput setaf 2; echo "thought is not set."; tput sgr0
        valid="false"
    fi

    if [ $valid == "true" ]; then
        tput setaf 2; echo "All parameter checks passed."; tput sgr0
    else
        tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0
        exit 1
    fi

    echo "Finished checking parameters at $(date)"
    echo ""
}

cowthink_thought() {
    printf "\nCowthink on Mac.\n\n"
    check_os_for_mac

    get_thought
    check_parameters

    if [ -d $(which cowthink) ]; echo $? == 0 &>/dev/null
    then 
        tput setaf 2; echo "cowthink is installed."; tput sgr0
        
        start=$(date +%s)
        echo "Started cowthink at $(date)"

        cowthink "$thought"

        tput setaf 2; echo "Successfully performed cowthink."; tput sgr0

        end=$(date +%s)
        echo "Finished cowthink at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
    else 
        tput setaf 1; echo "cowthink is not installed."; tput sgr0
        exit 1
    fi
}

cowthink_thought
