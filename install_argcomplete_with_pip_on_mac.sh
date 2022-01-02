#!/bin/bash 

# install argcomplete with PIP on Mac

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

check_argcomplete() {
    echo "Started checking argcomplete at $(date)"

    if [ -d $(which argcomplete) ]; echo $? == 0 &>/dev/null
    then
        tput setaf 2; echo "argcomplete is installed."; tput sgr0

        echo "Finished checking argcomplete at $(date)"
        echo ""

        exit 0
    else 
        tput setaf 1; echo "argcomplete is not installed."; tput sgr0
        
        echo "Finished checking argcomplete at $(date)"
        echo ""
    fi
}

check_python3() {
    echo "Started checking Python3 at $(date)"

    if [ -d $(which python3) ]; echo $? == 0 &>/dev/null
    then
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

install_argcomplete() {
    printf "\nInstall argcomplete with PIP on Mac.\n\n"
    
    check_os_for_mac
    check_argcomplete
    check_python3
    check_pip

    start=$(date +%s)
    echo "Started installing argcomplete at $(date)"

    python3 -m pip install argcomplete

    tput setaf 2; "Successfully installed argcomplete."; tput sgr0

    end=$(date +%s)
    echo "Finished installing argcomplete at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

install_argcomplete
