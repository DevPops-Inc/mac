#!/bin/bash
set -e 

# install asciiquarium with Homebrew

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

    if which -s brew; then 
        tput setaf 2; echo "Homebrew is installed."; tput sgr0

        echo "Finished checking Homebrew at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Homebrew needs to be installed."; tput sgr0

        echo "Finished checking Homebrew at $(date)"
        echo ""

        exit 1
    fi
}

check_asciiquarium() {
    echo "Started checking asciiquarium at $(date)"

    if which -s asciiquarium; then 
        tput setaf 2; echo "asciiquarium is installed."; tput sgr0

        echo "Finished checking asciiquarium at $(date)"
        echo ""
        exit 0
    else
        tput staf 1; echo "asciiquarium is not installed."; tput sgr0

        echo "Finished checking asciiquarium at $(date)"
        echo ""
    fi
}

install_asciiquarium() {
    printf "\nInstall asciiquarium with Homebrew.\n\n"

    check_os_for_mac
    check_homebrew
    check_asciiquarium

    start=$(date +%s)
    echo "Started installing asciiquarium at $(date)"

    brew install asciiquarium

    tput setaf 2; echo "Succesfully installed asciiquarium."; tput sgr0
    asciiquarium

    end=$(date +%s)
    echo "Finished installing asciiquarium at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

install_asciiquarium
