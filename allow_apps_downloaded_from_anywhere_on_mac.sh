#!/bin/bash

# allow apps downloaded from anywhere on Mac

check_os_for_mac() {
    
    printf "\nChecking operating system...\n"

    if [[ $OSTYPE == 'darwin'* ]]; then
        tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0
        printf "Finished checking operating system.\n\n"
    else
        tput setaf 1; echo "Sorry but this script only works on Mac."; tput sgr0
        printf "Finished checking operating system.\n\n"
        exit 1
    fi
}

allow_apps_downloaded_from_anywhere() { 
    printf "\nAllow apps to be downloded from anywhere on Mac.\n"
    check_os_for_mac

    start=$(date +%s)
    printf "Started allowing apps to be downloaded from anywhere...\n"
    
    sudo spctl --master-disable 

    printf "\nExpand Apple menu and select \"System Preferences...\"\nSelect \"Security & Privacy\"\nSelect \"General\" tab and you will see \"Anywhere\" option under \"Allow apps downloaded from:\" list now.\nSelect the lock icon and log in with your credentials.\nSelect \"Anywhere\" to allow apps to be downloaded from anywhere on your Mac.\n"

    tput setaf 2; echo -e "\nFinished allowing apps to be downloaded from anywhere."; tput sgr0

    end=$(date +%s)
    duration=$(( $end - $start ))
    printf "\nTotal execution time: $duration second(s)"
}

allow_apps_downloaded_from_anywhere
