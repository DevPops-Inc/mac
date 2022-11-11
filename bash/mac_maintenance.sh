#!/bin/bash
set -e

# Mac maintenance

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

rebuild_spotlight_index() {
    echo "Started rebuilding Spotlight index at $(date)"

    sudo mdutil -i on /

    echo "Finished rebuilding Spotlight index at $(date)"
    echo ""
}

install_mac_updates() {
    echo "Started installing Mac updates at $(date)"

    softwareupdate --install --all

    echo "Finished installing Mac updates at $(date)"
    echo ""
}

verify_mac_hd() {
    echo "Started verifying Mac HD at $(date)"

    diskutil verifyVolume "MacOS"

    echo "Finished verifying Mac HD at $(date)"
    echo ""
}

repair_mac_hd() {
    echo "Start repairing Mac HD at $(date)"

    diskutil repairVolume "MacOS"

    echo "Finished repairing Mac HD at $(date)"
    echo ""
}

restart_mac() {
    echo "Save your documents and close applications."
    read -p "Press any key to restart Mac."
    reboot
}

run_mac_maintenance() {
    printf "\nRun Mac maintenance.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started running Mac maintenance at $(date)"

    rebuild_spotlight_index

    echo "Would you like to install Mac updates now?"
    read -p "Please type \"Y\" or \"N\" and press \"return\" key: " answer

    if [[ $answer == 'Y' || 'y' ]]; then
        install_mac_updates
    fi

    verify_mac_hd
    repair_mac_hd

    end=$(date +%s)
    echo "Finished running Mac maintenance at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""

    restart_mac
}

run_mac_maintenance
