#!/bin/bash
set -e 

# install steam locomotive with Homebrew

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

check_sl() {
    echo "Started checking steam locomotive at $(date)"

    if which -s sl; then
        tput setaf 2; echo "steam locomotive is installed." tput sgr0

        echo "Finished checking steam locomotive at $(date)"
        echo ""

        exit 0
    else
        tput setaf 1; echo "steam locomotive is not installed." tput sgr0

        echo "Finished chekcing steam locomotive at $(date)"
        echo ""
    fi
}

check_homebrew() {
    echo "Started checking Homebrew at $(date)"

    if which -s brew; then 
        tput setaf 2; echo "Homebrew is installed."; tput sgr0

        echo "Finished checking Homebrew at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Homebrew is not installed."; tput sgr0

        echo "Finished checking Homebrew at $(date)"
        echo ""

        exit 1
    fi
}

install_steam_locomotive() {
    printf "\nInstall steam locomotive with Homebrew.\n\n"
    
    check_os_for_mac
    check_sl
    check_homebrew

    start=$(date +%s)
    echo "Started installing steam locomotive at $(date)"

    brew install sl
    sl
    tput setaf 2; echo "Successfully installed steam locomotive."; tput sgr0

    end=$(date +%s)
    echo "Finished installing steam locomotive at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

install_steam_locomotive
