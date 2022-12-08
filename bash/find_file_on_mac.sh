#!/bin/bash
set -e

# fine file on Mac 

# you can run this script with: ./file_file_on_mac.sh < filename > 

fileName=$1 # you can set the filename here 

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

get_filename() {
    if [ -z $fileName ]; then 
        read -p "Please type the filename you are looking for and press \"return\" key (Example: config.sh): " fileName

        echo ""
    else 
        echo $fileName &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameter(s) at $(date)"
    valid="true"

    echo "Parameter(s):"
    echo "-------------------"
    echo "fileName: $fileName"
    echo "-------------------"

    if [ -z $fileName ]; then 
        tput setaf 1; echo "fileName is not set."; tput sgr0
        valid="false"
    fi 

    if [ $valid == "true" ]; then 
        tput setaf 2; echo "All parameter check(s) passed."; tput sgr0

        echo "Finished checking parameter(s) at $(date)"
        echo ""
    else 
        tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0

        echo "Finished checking parameter(s) at $(date)"
        echo ""
    fi
}

find_file() {
    printf "\nFind file on Mac.\n\n"
    check_os_for_mac

    get_filename
    check_parameters

    start=$(date +%s)
    echo "Started finding file at $(date)"

    find / -name $fileName 

    tput setaf 2; echo "Successfully found file."; tput sgr0

    end=$(date +%s)    
    echo "Finished finding file at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

find_file
