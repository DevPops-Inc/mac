#!/bin/bash
set -e 

# check JDK on Mac

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

check_jdk() {
    printf "\nCheck JDK on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started checking JDK at $(date)"

    if [ -d "/Library/Java/JavaVirtualMachines/*jdk*" ]; echo $? == 0 &>/dev/null
    then
            tput setaf 2; echo "JDK is installed."; tput sgr0
            java -version

            end=$(date +%s)
            echo "Finished checking JDK at $(date)"

            duration=$(( $end - $start ))
            echo "Total execution time: $duration second(s)"
            echo ""

            exit 0
    else 
            tput setaf 1; echo "JDK is not installed."; tput sgr0

            end=$(date +%s)
            echo "Finished checking JDK at $(date)"

            duration=$(( $end - $start ))
            echo "Total execution time: $duration second(s)"
            echo ""
    fi
}

check_jdk
