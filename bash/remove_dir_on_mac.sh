#!/bin/bash
set -e

# remove directory on Mac

# you can run this script with: ./remove_dir_on_mac < dirPath > 

dirPath=$1

check_os_for_mac() {
    echo "Starting checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating System:\n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

get_dir_path() {
    if [ -z $dirPath ]; then 
        read -p "Please type the directory path you wish to remove and press \"return\" key (Example: /Users/$USER/Desktop/test1" dirPath

        echo ""
    else
        echo $dirPath &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameters at $(date)"
    valid="true"

    echo "Parameters:"
    echo "-----------------"
    echo "dirPath: $dirPath"
    echo "-----------------"

    if [ -z $dirPath ]; then 
        tput setaf 1; echo "dirPath is not set."; tput sgr0
        valid="false"
    fi

    if [ $valid == "true" ]; then 
        tput setaf 2; echo "All parameter checks passed."; tput sgr0

        echo "Finished checking parameters at $(date)"
        echo ""
    else
        tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0

        echo "Finished checking parameters at $(date)"
        echo ""

        exit 1
    fi
}

remove_dir() {
    printf "\nRemove directory on Mac.\n\n"
    check_os_for_mac

    get_dir_path
    check_parameters

    start=$(date +%s)
    echo "Started removing directory at $(date)"

    printf "Removing: "; rm -frv !/ $dirPath
    tput setaf 2; echo "Successfully removed directory: $dirPath"; tput sgr0

    end=$(date +%s)
    echo "Finished removing directory at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

remove_dir
