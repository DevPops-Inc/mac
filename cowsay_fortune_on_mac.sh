#!/bin/bash

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

check_fortune() {
    echo "Started checking fortune at $(date)"

    if [ -d $(which fortune) ]; echo $? == 0 $>/dev/null
    then 
        tput setaf 2; echo "fortune is installed."; tput sgr0

        echo "Finished checking fortune at $(date)"
        echo ""
    else 
        tput setaf 1; echo "fortune is not installed."; tput sgr0

        echo "Finished checking fortune at $(date)"
        echo ""
    fi
}

check_cowsay() {
    echo "Started checking cowsay at $(date)"

    if [ -d $(which cowsay) ]; echo $? == 0 &>/dev/null
    then 
        tput setaf 2; echo "cowsay is installed."; tput sgr0

        echo "Finished checking cowsay at $(date)"
        echo ""
    else 
        tput setaf 1; echo "cowsay is not installed."; tput sgr0

        echo "Finished checking cowsay at $(date)"
        echo ""

        exit 1
    fi
}

# define main function
cowsay_fortune() {
    printf "\nHave the cow tell your fortune.\n\n"
    
    check_os_for_mac
    check_fortune
    check_cowsay

    start=$(date +%s)
    echo "Started cow telling your fortune at $(date)"

    fortune | cowsay

    tput setaf 2; echo "Successfully had cow tell your fortune."; tput sgr0

    end=$(date +%s)
    echo "Finished cow telling your fortune at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
}

# call main function 
cowsay_fortune
