#!/bin/bash
set -e

# merge directories on Mac

# you can run this script with: ./merge_folders_on_mac.sh < source directory > < destination directory > 

sourceDir=$1
destinationDir=$2 

check_os_for_mac() { 
    echo "Started checking operating system at $(date)"

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

get_source_dir() {
    if [ -z $sourceDir ]; then 
        read -p "Please type the source directory and press \"return\" key (Example: /Users/Vic/Desktop/Games): " sourceDir

        echo ""
    else 
        echo sourceDir &>/dev/null
    fi
}

get_destination_dir() {
    if [ -z $destinationDir ]; then 
        read -p "Please type the destination directory and press \"return\" key (Example: /Users/Vic/Documents/Games): " destinationDir

        echo ""
    else
        echo destinationDir &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameter(s) at $(date)"
    valid="true"

    echo "Parameter(s):"
    echo "-------------------------------"
    echo "sourceDir     : $sourceDir"
    echo "destinationDir: $destinationDir"
    echo "-------------------------------"

    if [ -z $sourceDir ]; then 
        tput setaf 1; echo "sourceDir is not set."; tput sgr0
        valid="false"
    fi
    
    if [ -z $destinationDir ]; then 
        tput setaf 1; echo "destinationDir is not set."; tput sgr0
        valid="false"
    fi

    if [ $valid == "true" ]; then 
        tput setaf 2; echo "All parameter check(s) passed."; tput sgr0

        echo "Finished checking parameter(s) at $(date)"
        echo ""
    else 
        tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0

        echo "Finished checking parmameters at $(date)"
        echo ""

        exit 1
    fi
}

merge_directories_on_mac() {
    printf "\nMerge directories on Mac.\n\n"
    check_os_for_mac

    get_source_dir
    get_destination_dir
    check_parameters

    start=$(date +%s)
    echo "Started merging directories at $(date)"

    ditto $sourceDir $destinationDir -v
    
    tput setaf 2; echo "Successfully merged directories."; tput sgr0

    end=$(date +%s)
    echo "Finished merging directories at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

merge_directories_on_mac
