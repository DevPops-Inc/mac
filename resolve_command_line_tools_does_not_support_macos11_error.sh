#!/bin/bash

# resolve Command Line Tools does not support macOS 11 error

# run this script with: sudo /.resolve_command_line_tools_does_not_support_macos11_error.sh

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating system:\n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

resolve_command_line_tools_error() {
    printf "\nResolve Command Line Tools does not support macOS 11 error.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started resolving Command Line Tools error at $(date)"

    softwareupdate --all --install --force
    sudo rm -rf /Library/Developer/CommandLineTools/
    sudo xcode-select --install
    tput setaf 2; echo "Successfully resolved Command Line Tools error."; tput sgr0

    end=$(date +%s)
    echo "Finished resolving Command Line Tools error at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

resolve_command_line_tools_error
