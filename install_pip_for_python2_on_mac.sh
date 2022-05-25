#!/bin/bash

# install PIP for Python 2 on Mac

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating system:\n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    fi
}

check_pip() {
    echo "Started checking PIP at $(date)"

    which -s pip
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "PIP is installed."; tput sgr0
        pip --version
        
        echo "Finished checking PIP at $(date)"
        echo ""

        exit 0
    else 
        tput setaf 1; echo "PIP needs to be installed."; tput sgr0

        echo "Finished checking PIP at $(date)"
        echo ""
    fi
}

check_python2() {
    echo "Started checking Python 2 at $(date)"

    which -s python
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "Python 2 is installed."; tput sgr0
        python --version

        echo "Finished checking Python 2 at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Python 2 isn't installed."; tput sgr0

        echo "Finished checking Python 2 at $(date)"
        echo ""

        exit 1
    fi
}

install_pip_for_python2() {
    printf "\nInstall PIP for Python 2.\n\n"
    
    check_os_for_mac
    check_pip
    check_python2

    start=$(date +%s)
    echo "Started installing PIP at $(date)"

    easy_install pip
    pip --version
    tput setaf 2; echo "Successfully installed PIP."; tput sgr0

    end=$(date +%s)
    echo "Finished installing PIP at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

install_pip_for_python2
