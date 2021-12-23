#!/bin/bash

# check Python 2 on Mac

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

check_python2() {
    echo "Started checking Python 2 at $(date)"    

    if [ -d $(which python2) ]; echo $? == 0 &>/dev/null
    then
        tput setaf 2; echo "Python 2 is installed."; tput sgr0

        echo "Finished checking Python 2 at $(date)"
        echo ""
    else
        tput setaf 1; echo "Python 2 is not installed."; tput sgr0

        echo "Finished checking Python 2 at $(date)"
        echo ""

        exit 1
    fi
}

get_python2_version() {
printf "\nGet Python 2 version on Mac.\n\n"
    check_os_for_mac
    check_python2

    start=$(date +%s)
    echo "Started getting Python 2 version at $(date)"

    printf "Python 2 version is: " 
    $(python --version)

    tput setaf 2; echo "Successfully got Python 2 version."; tput sgr0

    end=$(date +%s)
    echo "Finished getting Python 2 version at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

get_python2_version
