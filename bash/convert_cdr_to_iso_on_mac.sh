#!/bin/bash
set -e

# convert .cdr to .iso on Mac

# run this script with: ./convert_cdr_to_iso_on_mac.sh

filename=$1 # you can set the filename here

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
    if [ -z $filename ]; then 
        read -p "Please type the filename of the .cdr file you wish to convert to .iso and press \"return\" key (Example: test): " filename

        echo ""
    else
        echo $filename &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameter(s) at $(date)"
    valid="true"

    echo "Parameter(s):"
    echo "-------------------"
    echo "filename: $filename"
    echo "-------------------"

    if [ -z $filename ]; then 
        tput setaf 1; echo "filename is not set."; tput sgr0
        valid="false"

    if [ $valid == "true" ]; then 
        tput setaf 2; echo "All parameter check(s) passed."; tput sgr0

        echo "Finished checking parameter(s) at $(date)"
        echo ""
    else 
        tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0

        echo "Finished checking parameter(s) at $(date)"
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

    start=$(date +%s)
    echo "Started converting $filename.cdr to $filename.iso at $(date)"
    
    hdiutil makehybrid -iso -joliet -o $filename.iso $filename.cdr
    ls $filename.iso

    tput setaf 2; echo "Successfully converted $filename.cdr to $filename.iso"; tput sgr0

    end=$(date +%s)
    echo "Finished converting $filename.cdr to $filename.iso at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

# call main function 
convert_cdr_to_iso
