#!/bin/bash

# install colorama with PIP on Mac

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
    fi
}

check_colorama() {
    echo "Started checking colorama at $(date)"

    if [ -d $(which colorama) ]; echo $? == 0 &>/dev/null
    then
        tput setaf 2; echo "colorama is installed."; tput sgr0

        echo "Finished checking colorama at $(date)"
        echo ""

        exit 0
    else 
        tput setaf 1; echo "colorama is not installed."; tput sgr0

        echo "Finished checking colorama at $(date)"
        echo ""
    fi
}

check_pip() {
    echo "Started checking PIP at $(date)"

    if [ -d $(which pip) ]; echo $? == 0 &>/dev/null
    then 
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

install_colorama() {
    printf "\nInstall colorama with PIP on Mac.\n\n"

    check_os_for_mac
    check_colorama
    check_pip

    start=$(date +%s)
    echo "Started installing colorama at $(date)"

    pip install colorama
    tput setaf 2; echo "Successfully installed colorama."; tput sgr0

    end=$(date +%s)
    echo "Finished installing colorama at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

install_colorama
