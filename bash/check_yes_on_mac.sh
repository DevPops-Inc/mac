#!/bin/bash
set -e 

# check yes on Mac

terminalApp="yes"

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
        read -p "Please type the terminal application you would like to check and press \"return\" key (Example: yes): " terminalApp

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

check_yes() {
    printf "\nCheck yes on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started checking yes at $(date)"

    if which -s yes; then 
        tput setaf 2; echo "yes is installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking yes at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
    else 
        tput setaf 1; echo "yes is not installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking yes at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""

        exit 1
    fi
}

check_yes
