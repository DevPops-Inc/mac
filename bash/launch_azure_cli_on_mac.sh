#!/bin/bash
set -e

# launch Azure CLI on Mac

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

check_azure_cli() {
    echo "Started checking Azure CLI at $(date)"

    which -s az 
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "Azure CLI is installed."; tput sgr0
        az --version 

        echo "Finished checking Azure CLI at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Azure CLI is not installed."; tput sgr0

        echo "Finished checking Azure CLI at $(date)"
        echo ""

        exit 1
    fi
}

launch_azure_cli() {
    printf "\nLaunch Azure CLI on Mac.\n\n"
    
    check_os_for_mac
    check_azure_cli

    start=$(date +%s)
    echo "Started launching Azure CLI at $(date)"

    az login
    tput setaf 2; echo "Successfully launched Azure CLI."; tput sgr0

    end=$(date +%s)
    echo "Finished launching Azure CLI at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

launch_azure_cli
