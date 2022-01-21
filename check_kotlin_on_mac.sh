#!/bin/bash 

# check Kotlin on Mac 

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

check_kotlin() {
    printf "Check Kotlin on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started checking Kotlin at $(date)"

    if [ -d $(which kotlin) ]; echo $? == 0 &>/dev/null
    then 
        tput setaf 2; echo "Kotlin is installed."; tput sgr0
        kotlin -version

        end=$(date +%s)
        echo "Finished checking Kotlin at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""

        exit 0
    else 
        tput setaf 1; echo "Kotlin is not installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking Kotlin at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
    fi
}

check_kotlin
