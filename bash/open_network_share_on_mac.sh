#!/bin/bash

# open network share on mac

# you can run this script with: ./open_network_share_on_mac.sh < network share path > 

networkSharePath=$1

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

get_network_share_path() {
    if [ -z $networkSharePath ]; then 
        read -p "Please type the network share path and press \"return\" key (Example: smb://file-server): " networkSharePath

        echo ""
    else 
        echo $networkSharePath &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameter(s) at $(date)"
    valid="true"

    echo "Parameter(s):"
    echo "-----------------------------------"
    echo "networkSharePath: $networkSharePath"
    echo "-----------------------------------"

    if [ -z $networkSharePath ]; then 
        tput setaf 1; echo "networkSharePath is not set."; tput sgr0
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

open_network_share() {
    printf "\nOpen network share on Mac.\n\n"
    check_os_for_mac

    get_network_share_path
    check_parameters

    start=$(date +%s)
    echo "Started opening network share at $(date)"

    open $networkSharePath
    tput setaf 2; echo "Successfully opened network share."; tput sgr0

    end=$(date +%s)
    echo "Finished opening network share at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

open_network_share
