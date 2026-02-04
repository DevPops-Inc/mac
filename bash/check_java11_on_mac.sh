#!/bin/bash
set -e 

# check Java 11 on Mac

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else
        tput setaf 1; echo "Sorry but this script only runs on Mac."

        echo "Finished checking operating system at $(date)"
        echo ""
    fi
}

check_java11() {
    printf "\nCheck Java 11 on Mac."
    check_os_for_mac

    start=$(date +%s)
    echo "Started checking Java 11 at $(date)"

    if [ -d "/Library/Java/JavaVirtualMachines/*jdk-11*" ]; echo $? == 0 &>/dev/null
    then
        tput setaf 2; echo "Java 11 is installed."; tput sgr0
        java -version

        end=$(date +%s)
        echo "Finished checking Java 11 at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""

        exit 0
    else
        tput setaf 1; echo "Java 11 needs to be installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking Java 11 at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
    fi
}

check_java11
