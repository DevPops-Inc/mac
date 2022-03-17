#!/bin/bash
set -e

# copy directory on Mac

# you can run this script with: ./copy_directory_on_mac.sh < source > < destination > 

source=$1 # you can set the source here 
destination=$2 # you can set the destination here

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0
        
        echo "Finished checking operating system at $(date)"
        echo 
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

get_source() { 
    if [ -z $source ]; then 
        read -p "Please type the source directory you wish to copy and press \"return\" key (Example: /Documents): " source

        echo ""
    else 
        echo $source
    fi
}

get_destination() {
    if [ -z $destination ]; then 
        read -p "Please type the destination directory you wish to copy to and press \"return\" key (Example: /Desktop): " destination

        echo ""
    else 
        echo $destination
    fi
}

check_parameters() {
    echo "Started checking parameters at $(date)"
    valid="true"

    echo "Parameters:"
    echo "-------------------------"
    echo "source     : $source"
    echo "destination: $destination"
    echo "-------------------------"

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

# define main function 
copy_directory() {
    printf "\nCopy Directory on Mac.\n\n"
    check_os_for_mac

    get_source
    get_destination
    check_parameters

    start=$(date +%s)
    echo "Started copying directory at $(date)"

    cp -R $source /$destination
    ls $destination

    tput setaf 2; echo "Successfully copied directory."; tput sgr0

    end=$(date +%s)
    echo "Finished copying directory at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

# call main function
copy_directory
