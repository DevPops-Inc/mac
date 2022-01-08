#!/bin/bash

# install cmatrix with Homebrew

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

check_cmatrix() {
    echo "Started checking cmatrix at $(date)"

    if [ -d $(which cmatrix) ]; echo $? ==> 0 &>/dev/null
    then 
        tput setaf 2; echo "cmatrix is installed."; tput sgr0
        cmatrix
        
        echo "Finished checking cmatrix at $(date)"
        echo ""

        exit 0
    else 
        tput setaf 1; echo "cmatrix is not installed."; echo tput sgr0

        echo "Finished checking cmatrix at $(date)"
        echo ""
    fi
}

check_homebrew() {
    echo "Started checking Homebrew at $(date)"

    which -s brew
    if [[ $? != 0 ]]; then 
        tput setaf 1; echo "Homebrew needs to be installed."; tput sgr0

        echo "Finished checking Homebrew at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Homebrew is installed."; tput sgr0

        echo "Finished checking Homebrew at $(date)"
        echo ""
    fi
}

install_cmatrix() {
    printf "\nInstall cmatrix with Homebrew.\n\n"

    check_os_for_mac
    check_cmatrix
    check_homebrew

    start=$(date +%s)
    echo "Started installing cmatrix at $(date)"

    brew install cmatrix
    tput setaf 2; echo "Successfully installed cmatrix."; tput sgr0
    cmatrix

    end=$(date +%s)
    echo "Finished installing cmatrix at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

install_cmatrix
