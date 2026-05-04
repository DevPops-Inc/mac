#!/bin/bash
set -e 

# install Node with Homebrew

check_os_for_mac() {
    echo "Starting checking operating system at $(date)"

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

check_node() {
    echo "Started checking Node at $(date)"

    if which -s node; then
        tput setaf 2; echo "Node is installed."; tput sgr0
        node --version 

        echo "Finished checking Node at $(date)"
        echo ""
        
        exit 1
    else
        tput setaf 1; echo "Node needs to be installed."; tput sgr0
        echo ""
    fi
}

check_homebrew() {
    echo "Started checking Homebrew at $(date)"

    if which -s brew; then
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

install_node() {
    printf "\nInstall Node on Mac.\n\n"
    check_os_for_mac
    check_node
    check_homebrew

    echo "Started installing Node at $(date)"
    start=$(date +%s)

    brew install node
    tput setaf 2; echo "Successfully installed Node."; tput sgr0
    node --version
    npm --version

    echo "Finished installing Node at $(date)"
    end=$(date +%s)

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

install_node
