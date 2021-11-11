#!/bin/bash

# cowthink fortune on Mac

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

    if [ -d $(which fortune) ]; echo $? == 0 &>/dev/null
    then 
        tput setaf 2; echo "fortune is installed."; tput sgr0

        echo "Finished checking fortune at $(date)"
        echo ""
    else 
        tput setaf 1; echo "fortune is not installed."; tput sgr0

        echo "Finished checking fortune at $(date)"
        echo ""

        exit 1
    fi
}

check_cowthink() {
    echo "Started checking cowthink at $(date)"

    if [ -d $(which cowthink) ]; echo $? == 0 &>/dev/null
    then 
        tput setaf 2; echo "cowthink is installed."; tput sgr0

        echo "Finished checking cowthink at $(date)"
        echo ""
    else 
        tput setaf 1; echo "cowthink is not installed."; tput sgr0

        echo "Finished checking cowthink at $(date)"
        echo ""

        exit 1
    fi
}

# define main function
cowthink_fortune() {
    printf "\nHave the cow think your fortune.\n\n"
    
    check_os_for_mac
    check_fortune
    check_cowthink

    start=$(date +%s)
    echo "Started cow thinking your fortune at $(date)"

    fortune | cowthink

    tput setaf 2; echo "Successfully had cow think your fortune."; tput sgr0

    end=$(date +%s)
    echo "Finished cow thinking your fortune at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

# call main function 
cowthink_fortune
