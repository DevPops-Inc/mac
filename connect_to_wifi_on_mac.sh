#!/bin/bash
set -e

# connect to Wi-Fi on Mac

# run this script with: ./connect_to_wifi_on_mac.sh < network SSID > < network password > 

ssid=$1
password=$2

check_os_for_mac() { 
    printf "\nStarted checking operating system at $(date)\n"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0
        echo "Finished checking operating system at $(date)"
    else 
        tput setaf 1; echo "Sorry but this script only works on Mac."; tput sgr0
        echo "Finished checking operating system at $(date)"
        exit 1
    fi
}

get_ssid() { 
    if [ -z $ssid ]; then 
        printf "\nAvailable Wi-Fi networks: \n"
        
        /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport scan

        printf "\nPlease type the SSID you wish to connect to and press \"return\" key (Example: YourWiFi): "

        read ssid
    else 
        echo $ssid
    fi 
}

getPassword() { 
    if [ -z $password ]; then 
        printf "\nPlease type password for the SSID and press \"return\" key (Example: YourPassword): "

        read -s password
    else 
        echo $password
    fi
}

check_parameters() { 
    printf "\n\nStarted checking parameters at $(date)\n"
    valid="true"

    echo "Parameters:"
    echo "----------------------------------------"
    echo "ssid: $ssid"
    echo "password: ***"
    echo "----------------------------------------"

    echo "Finished checking parameters at $(date)"

    if [ -z $ssid ]; then 
        tput setaf 1; echo "ssid is not set."; tput sgr0
        valid="false"
    fi

    if [ -z $password ]; then 
        tput setaf 1; echo "password is not set."; tput sgr0
        valid="false"
    fi
    
    if [ $valid == "true" ]; then 
        tput setaf 2; echo "All parameter checks passed."; tput sgr0
        echo ""
    else 
        tput setaf 1; echo "One or more parameters are incorrect, exiting script."; tput sgr0

        echo ""
        exit 1
    fi
}

# define main function 
connect_to_wifi() { 
    printf "\nConnect to Wi-Fi on Mac.\n"
    check_os_for_mac

    get_ssid
    getPassword
    check_parameters

    echo "Started connecting to WiFi at $(date)"
    start=$(date +%s)

    networksetup -setairportnetwork en0 $ssid $password
    
    /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport scan | grep "$ssid"

    tput setaf 2; echo -e "\nFinished connecting to WiFi at $(date)"; tput sgr0
    end=$(date +%s)

    duration=$(( $end - $start ))
    printf "\nTotal execution time: $duration second(s)\n"
}

# call main function 
connect_to_wifi
