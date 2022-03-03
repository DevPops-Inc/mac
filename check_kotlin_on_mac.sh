#!/bin/bash 

# check Kotlin on Mac 

terminalApp="kotlin"

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

get_terminal_app() {
    if [ -z $terminalApp ]; then 
        read -p "Please type the terminal application and press the \"return\" key (Example: kotlin): " terminalApp

        echo ""
    else 
        echo $terminalApp &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameters at $(date)"
    valid="true"

    echo "Parameters:"
    echo "-------------------------"
    echo "terminalApp: $terminalApp"
    echo "-------------------------"

    if [ -z $terminalApp ]; then 
        tput setaf 1; echo "terminalApp is not set."; tput sgr0
        valid="false"
    fi

    if [ $valid == "true" ]; then 
        tput setaf 2; echo "All parameter checks passed."; tput sgr0

        echo "Finished checking parameters at $(date)"
        echo ""
    else 
        tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0

        echo "Finished checking parameters at $(date)"
        echo ""

        exit 1
    fi
}

check_terminal_app() {
    printf "Check $terminalApp on Mac.\n\n"
    check_os_for_mac

    get_terminal_app
    check_parameters

    start=$(date +%s)
    echo "Started checking $terminalApp at $(date)"

    which -s $terminalApp
    if [ $? == 0 ]; then 
        tput setaf 2; echo "$terminalApp is installed."; tput sgr0
        $terminalApp -version
        tput setaf 2; echo "Successfully checked $terminalApp."; tput sgr0

        end=$(date +%s)
        echo "Finished checking $terminalApp at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
    else 
        tput setaf 1; echo "$terminalApp is not installed."; tput sgr0
        tput setaf 2; echo "Successfully checked $terminalApp."; tput sgr0

        end=$(date +%s)
        echo "Finished checking $terminalApp at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""

        exit 1
    fi
}

check_terminal_app
