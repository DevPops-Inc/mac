#!/bin/bash
set -e 

# check XCode command line tools on Mac

terminalApp="xcode-select"

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

get_terminal_app() {
    if [ -z $terminalApp ]; then 
        read -p "Please type the terminal application you would like to check and press \"return\" key (Example: xcode-select): " terminalApp

        echo ""
    else 
        echo $terminalApp &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameter(s) at $(date)"
    valid="true"

    echo "Parameter(s):"
    echo "-------------------------"
    echo "terminalApp: $terminalApp"
    echo "-------------------------"

    if [ -z $terminalApp ]; then 
        tput setaf 1; echo "terminalApp is not set."; tput sgr0
        valid="false"
    fi

    if [ $valid == "true" ]; then 
        tput setaf 2; echo "All parameter check(s) passed."; tput sgr0

        echo "Finished checking parameter(s) at $(date)"
    else 
        tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0

        echo "Finished checking parameteres at $(date)"
        echo ""
    fi
}

check_xcode_command_line_tools() {
    printf "\nCheck XCode command line tools on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started checking XCode command line tools at $(date)"

    if which -s "$terminalApp"; then 
        tput setaf 2; echo "XCode command line tools are installed."; tput sgr0
        xcode-select --version

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
