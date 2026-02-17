#!/bin/bash
set -e 

# check steam locomotive 

terminalApp="sl"

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
    if [ -z "$terminalApp" ]; then 
        read -p "Please type the terminal application and press \"return\" key (Example: sl): " terminalApp

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

    if [ -z "$terminalApp" ]; then 
        tput setaf 1; echo "terminalApp is not set."; tput sgr0
        valid="false"
    fi

    if [ $valid == "true" ]; then
        tput setaf 2; echo "All parameter check(s) passed."; tput sgr0

        echo "Finished checking parameter(s) at $(date)"
        echo ""
    else 
        tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0

        echo "Finished checking parameter(s) at $(date)"
        echo ""

        exit 1
    fi
}

check_steam_locomotive() {
    printf "\nCheck steam locomotive on Mac.\n\n"
    check_os_for_mac

    get_terminal_app
    check_parameters

    start=$(date +%s)
    echo "Started checking steam locomotive at $(date)"

    if which -s "$terminalApp"; then 
        tput setaf 2; echo "Steam locomotive is installed."; tput sgr0
        sl
    else 
        tput setaf 1; echo "Steam locomotive is not installed"; tput sgr0
    fi

    tput setaf 2; echo "Successfully checked steam locomotive."; tput sgr0

    end=$(date +%s)
    echo "Finished checking steam locomotive at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

check_steam_locomotive
