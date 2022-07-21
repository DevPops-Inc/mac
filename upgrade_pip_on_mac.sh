#!/bin/bash

# upgrade PIP on Mac

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

check_pip() {
    echo "Started checking PIP at $(date)"

    which -s pip
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "PIP is installed."; tput sgr0

        echo "Finished checking PIP at $(date)"
        echo ""
    else 
        tput setaf 1; echo "PIP is not installed."; tput sgr0

        echo "Finished checking PIP at $(date)"
        echo ""

        exit 1
    fi
}

check_python3() {
    echo "Started checking Python 3 at $(date)"

    which -s python3
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "Python 3 is installed."; tput sgr0

        echo "Finished checking Python 3 at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Python 3 is not installed."; tput sgr0

        echo "Finished checking Python 3 at $(date)"
        echo ""

        exit 1
    fi
}

upgrade_pip() {
    printf "\nUpgrade PIP on Mac.\n\n"
    
    check_os_for_mac
    check_pip
    check_python3
    
    start=$(date +%s)
    echo "Started upgrading PIP at $(date)"

    python3 -m pip install --upgrade pip
    tput setaf 2; echo "Successfully upgraded PIP."; tput sgr0

    end=$(date +%s)
    echo "Finished upgrading PIP at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

upgrade_pip
