#!/bin/bash

# repair Homebrew after macOS Update

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating System:\n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finiished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

check_homebrew() {
    echo "Started checking Homebrew at $(date)"

    which -s brew
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "Homebrew is installed."; tput sgr0
        brew --version 

        echo "Finished checking Homebrew at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Homebrew is not installed."; tput sgr0

        echo "Finished checking Homebrew at $(date)"
        echo ""

        exit 1
    fi
}

repair_homebrew() {
    printf "\nRepair Homebrew after macOS update.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started repairing Homebrew at $(date)"

    brew update
    brew doctor
    brew upgrade
    tput setaf 2; echo "Successfully repaired Homebrew."; tput sgr0

    end=$(date +%s)
    echo "Finished repairing Homebrew at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

repair_homebrew
