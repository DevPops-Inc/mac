#!/bin/bash 

# check cowthink on Mac

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

check_cowthink() {
    printf "\nCheck cowthink on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started checking cowthink at $(date)"

    if [ -d $(which cowthink) ]; echo $? == 0 &>/dev/null
    then 
        tput setaf 2; echo "cowthink is installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking cowthink at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
    else 
        tput setaf 1; echo "cowthink is not installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking cowthink at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"

        exit 1
    fi
}

check_cowthink
