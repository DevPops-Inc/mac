#!/bin/bash

# delete printer on Mac

# you can run this script with: ./delete_printer_on_mac.sh < printer name >

printerName=$1 # you can set printer name here

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

get_printer_name() {
    if [ -z $printerName ]; then 
        read -p "Please type the printer name and press \"return\" key (Example: IT): " printerName

        echo ""
    else
        echo $printerName
    fi
}

check_parameters() {
    echo "Started checking parameters at $(date)"
    valid="true"

    echo "Parameters:"
    echo "-------------------------"
    echo "printerName: $printerName"
    echo "-------------------------"

    if [ -z $printerName ]; then 
        tput setaf 1; echo "printerName is not set."; tput sgr0
        valid="false"
    fi

    if [ $valid == "true" ]; then 
        tput setaf 2; echo "All parameter checks passed."; tput sgr0
    else 
        tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0
        exit 1
    fi 

    echo "Finished checking parameters at $(date)"
    echo ""
}

list_printers() {
    echo "The printers on this Mac are: "
    echo "------------------------------"
    lpstat -p | awk '{print $2}' 
    echo "------------------------------"
}

# define main function
delete_printer() {
    printf "\nDelete printer on Mac.\n\n"
    check_os_for_mac

    list_printers
    get_printer_name
    check_parameters

    start=$(date +%s)
    echo "Starting deleteing printer at $(date)"
    
    /usr/sbin/lpadmin -x $printerName # delete printer
    tput setaf 2; echo "Successfully deleted printer."; tput sgr0
    list_printers

    end=$(date +%s)
    echo "Finished deleting printer at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

# call main function
delete_printer
