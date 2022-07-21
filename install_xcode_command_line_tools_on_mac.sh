#!/bin/bash

# install XCode command line tools on Mac

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

check_xcode_command_line_tools() {
    echo "Started checking XCode command line tools at $(date)"

    which -s xcode-select
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "XCode command line tools are installed."; tput sgr0

        echo "Finished checking XCode command line tools at $(date)"
        echo ""

        exit 0
    else 
        tput setaf 1; echo "XCode command line tools are installed."; tput sgr0

        echo "Finished checking XCode command line tools at $(date)"
        echo ""
    fi
}

install_xcode_command_line_tools() {
    printf "\nInstall XCode command line tools on Mac.\n\n"
    
    check_os_for_mac
    check_xcode_command_line_tools
    
    start=$(date +%s)
    echo "Started installing XCode command line tools at $(date)"

    xcode-select --install
    tput setaf 2; echo "Successfully installed XCode command line tools."; tput sgr0

    end=$(date +%s)
    echo "Finished installing XCode command line tools at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

install_xcode_command_line_tools
