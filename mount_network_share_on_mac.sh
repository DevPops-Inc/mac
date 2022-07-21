#!/bin/bash

# mount networkshare on Mac

# you can run this script with: ./mount_network_share_on_mac.sh < network share path > 

networkSharePath=$1

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating System:\n$(sw_vers)"; then 
        
        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only works on Mac."; then 
        
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
    echo "Started checking parameters at $(date)"
    valid="true"

    echo "Parameters:"
    echo "-----------------------------------"
    echo "networkSharePath: $networkSharePath"
    echo "-----------------------------------"

    if [ -z $networkSharePath ]; then 
        tput setaf 1; echo "networkSharePath is not set."; tput sgr0
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

mount_network_share() {
    printf "\nMount network share on Mac.\n\n"
    check_os_for_mac

    get_network_share_path
    check_parameters

    start=$(date +%s)
    echo "Started mounting network share at $(date)"

    mount_smbfs -v $networkSharePath
    tput setaf 2; echo "Successfully mounted network share."; tput sgr0

    end=$(date +%s)
    echo "Finished mounting network share at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

mount_network_share
