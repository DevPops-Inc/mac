#!/bin/bash

# check Python 3 on Mac

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

check_python3() {
    echo "Started checking Python 3 at $(date)"    

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

get_python3_version() {
printf "\nGet Python 3 version on Mac.\n\n"
    check_os_for_mac
    check_python3

    start=$(date +%s)
    echo "Started getting Python 3 version at $(date)"

    printf "Python 3 version is: " 
    python3 --version

    tput setaf 2; echo "Successfully got Python 3 version."; tput sgr0

    end=$(date +%s)
    echo "Finished getting Python 3 version at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

get_python3_version
