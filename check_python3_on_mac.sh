#!/bin/bash 

# check Python3 on Mac

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
    printf "\nCheck Python 3 on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started checking Python 3 at $(date)"

    if [ -d $(which python3) ]; echo $? == 0 &>/dev/null
    then
        tput setaf 2; echo "Python 3 is installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking Python 3 at $(date)"

        duration=$(( $end-$start ))
        echo "Total execution time: $duration second(s)"
    else
        tput setaf 1; echo "Python 3 is not installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking Python 3 at $(date)"

        duration=$(( $end-$start ))
        echo "Total execution time: $duration second(s)"

        exit 1
    fi
}

check_python3
