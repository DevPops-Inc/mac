#!/bin/bash
set -e

# connect to Wi-Fi on Mac

# run this script with: ./connect_to_wifi_on_mac.sh < network SSID > < network password > 

ssid=$1 # you can set the SSID here 
password=$2 # you can set the Wi-Fi password here

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
        echo "Available Wi-Fi networks: "
        
        /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport scan

        read -p "Please type the SSID you wish to connect to and press \"return\" key (Example: YourWiFi): " ssid

        echo ""
    else 
        echo $ssid &>/dev/null
    fi 
}

getPassword() { 
    if [ -z $password ]; then 
        read -s "Please type password for the SSID and press \"return\" key (Example: YourPassword): " password

        echo ""
    else 
        echo $password &>/dev/null
    fi
}

check_parameters() { 
    echo "Started checking parameter(s) at $(date)"
    valid="true"

    echo "Parameter(s):"
    echo "---------------"
    echo "ssid    : $ssid"
    echo "password: ***"
    echo "---------------"

    if [ -z $ssid ]; then 
        tput setaf 1; echo "ssid is not set."; tput sgr0
        valid="false"
    fi

    if [ -z $password ]; then 
        tput setaf 1; echo "password is not set."; tput sgr0
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

# define main function 
connect_to_wifi() { 
    printf "\nConnect to Wi-Fi on Mac.\n\n"
    check_os_for_mac

    get_ssid
    getPassword
    check_parameters

    start=$(date +%s)
    echo "Started connecting to WiFi at $(date)"

    networksetup -setairportnetwork en0 $ssid $password
    
    /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport scan | grep "$ssid"

    tput setaf 2; echo "Successfully connected to Wi-Fi."; tput sgr0
    
    end=$(date +%s)
    echo "Finished connecting to Wi-Fi at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

# call main function 
connect_to_wifi
