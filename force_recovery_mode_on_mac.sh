#!/bin/bash

# force recovery mode on mac

check_os_for_mac() {

    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating System: \n(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    fi 
}

force_recovery_mode() {
    printf "\nForce recovery mode on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started forcing recovery mode at $(date)"

    sudo nvram "recovery-boot-mode=unused"

    tput setaf 2; echo "Successfully forced recovery mode."; tput sgr0

    end=$(date +%s)
    echo "Finished forcing recovery mode at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""

    echo "Please save your work and close your applications."
    read -p "Press any key to restart your Mac into recovery mode"
    sudo reboot
}

force_recovery_mode
