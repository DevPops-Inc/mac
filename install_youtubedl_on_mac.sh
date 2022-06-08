#!/bin/bash

# install YouTube Downloader with PIP on Mac

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating system:\n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 2; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

check_youtube-dl() {
    echo "Started checking youtube-dl at $(date)"
    
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "youtube-dl is installed."; tput sgr0
        youtube-dl --version

        echo "Finished checking youtube-dl at $(date)"
        echo ""

        exit 0
    else 
        tput setaf 1; echo "youtube-dl is not installed."; tput sgr0

        echo "Finished checking youtube-dl at $(date)"
        echo ""
    fi
}

check_pip3() {
    echo "Started checking PIP at $(date)"

    which -s pip3
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "PIP is installed."; tput sgr0
        pip3 --version

        echo "Finished checking PIP at $(date)"
        echo ""
    else 
        tput setaf 1; echo "PIP is installed."; tput sgr0

        echo "Finished checking PIP at $(date)"
        echo ""
    fi
}

install_youtube-dl_with_pip() {
    printf "\nInstall youtube-dl with PIP on Mac.\n\n"

    check_youtube-dl
    check_os_for_mac
    check_pip3

    start=$(date +%s)
    echo "Started installing youtube-dl at $(date)"

    pip3 install youtube-dl
    youtube-dl --version
    tput setaf 2; echo "Successfully installed youtube-dl."; tput sgr0

    end=$(date +%s)
    echo "Finished installing youtube-dl at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

install_youtube-dl_with_pip
