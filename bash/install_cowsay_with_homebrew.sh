#!/bin/bash

# install Cowsay with Homebrew

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

check_homebrew() {
    echo "Started checking Homebrew at $(date)"

    which -s brew
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "Homebrew is installed."; tput sgr0
        brew --version 

        echo "Finished checking Homebrew at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Homebrew needs to be installed."; tput sgr0

        echo "Finished checking Homebrew at $(date)"
        echo ""

        exit 1
    fi
}

install_cowsay() {
    printf "\nInstall cowsay with Homebrew.\n\n"

    check_os_for_mac
    check_cowsay
    check_homebrew

    start=$(date +%s)
    echo "Started installing cowsay at $(date)"

    brew install cowsay
    cowsay "cowsay succssfully installed."

    end=$(date +%s)
    echo "Finished installing cowsay at $(date)"

    duration=$(( $end - $start ))   
    echo "Total execution time: $duration second(s)"
    echo ""
}

install_cowsay