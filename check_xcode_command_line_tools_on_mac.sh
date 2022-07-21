#!/bin/bash

# check XCode command line tools on Mac

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
    printf "\nCheck XCode command line tools on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started checking XCode command line tools at $(date)"

    which -s xcode-select
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "XCode command line tools are installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking XCode command line tools at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""

        exit 0
    else 
        tput setaf 1; echo "XCode command line tools are installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking XCode command line tools at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
    fi
}

check_xcode_command_line_tools
