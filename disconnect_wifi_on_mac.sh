#!/bin/bash
set -e

# disconnect from Wi-Fi on Mac

# you can run this script with: ./disconnect_wifi_on_mac.sh < SSID > 

ssid=$1 # you can set the SSID you would like to disconnect from here

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

get_ssid() {
    if [ -z $ssid ]; then 
        read -p "Please type ssid you wish to disconnect from (Example: IT-Network): " ssid

        echo ""
    else 
        echo $ssid &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameters at $(date)"
    valid="true"

    echo "Parameters:"
    echo "-----------"
    echo "ssid: $ssid"
    echo "-----------"

    if [ -z $ssid ]; then 
        tput setaf 1; echo "ssid is not set."; tput sgr0
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

# define main function
disconnect_wifi() {
    printf "\nDisconnect from Wi-Fi on Mac.\n\n"
    check_os_for_mac

    get_ssid
    check_parameters

    start=$(date +%s)
    echo "Started disconnecting from $ssid at $(date)"

    networksetup -removepreferredwirelessnetwork en0 $ssid
    tput setaf 2; echo "Successfully disconnected from $ssid"; tput sgr0

    end=$(date +%s)
    echo "Finished disconnecting from $ssid at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

# call main function 
disconnect_wifi
