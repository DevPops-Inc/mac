#!/bin/bash
set -e

# convert .cdr to .iso on Mac

# run this script with: ./convert_cdr_to_iso_on_mac.sh

filename=$1

check_os_for_mac() {
    printf "\nStarted checking operating system at $(date)\n"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0
        echo "Finished checking operating system at $(date)"
    else 
        tput setaf 1; echo "Sorry but this script only works on Mac."; tput sgr0
        echo "Finished checking operating system at $(date)"
        exit 1
    fi
}

get_filename() {
    if [ -z $filename ]; then 
        printf "\Please type the filename of the .cdr file you wish to convert to .iso (Example: test): "

        read filename
    else
        echo $filename
    fi
}

check_parameters() {
    printf "\n\nStarted checking parameters at $(date)\n"
    valid="true"

    echo "Parameters:"
    echo "----------------------------------------"
    echo "filename: $filename"
    echo "----------------------------------------"

    echo "Finished checking parameters at $(date)"

    if [ -z $filename ]; then 
        tput setaf 1; echo "filename is not set."; tput sgr0
        valid="false"

    if [ $valid == "true" ]; then 
        tput setaf 2; echo "All parameter checks passed."; tput sgr0
        echo ""
    else 
        tput setaf 1; echo "One or more parameters are incorrect, exiting script."; tput sgr0

        echo ""
        exit 1
    fi 
}

# define main function 
convert_cdr_to_iso() {
    printf "\nConvert .cdr to .iso on Mac.\n"
    check_os_for_mac

    get_filename
    check_parameters

    echo "Started converting $filename.cdr to $filename.iso at $(date)"
    start=$(date +%s)
    
    hdiutil makehybrid -iso -joliet -o $filename.iso $filename.cdr
    ls $filename.iso

    tput setaf 2; echo -e "\nFinished converting $filename.cdr to $filename.iso at $(date)"
    end=$(date +%s)

    duration=$(( $end - $start ))
    printf "\nTotal execution time: $duration second(s)\n"
}

# call main function 
convert_cdr_to_iso
