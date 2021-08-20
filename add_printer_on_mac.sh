#!/bin/bash

# add printer on Mac

# you can run this script with: ./add_printer_on_mac.sh < printer name > < printer IP > 

printerName=$1
printerIp=$2

check_os_for_mac() {
    
    printf "\nChecking operating system...\n"

    if [[ $OSTYPE == 'darwin'* ]]; then
        tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0
        printf "Finished checking operating system.\n\n"
    else
        tput setaf 1; echo "Sorry but this script only works on Mac."; tput sgr0
        printf "Finished checking operating system.\n\n"
        exit 1
    fi
}

get_printer_name() {
    if [ -z $printerName ]; then 
        echo "Please type the printer name and press \"return\" key (Example: IT): "
        
        read printerName
    else 
        echo $printerName
    fi
}

get_printer_ip() {
    if  [ -z $printerIp]; then 
        echo "Please type the IP address of the printer and press \"return\" key (Example: 10.10.6.144): "
        
        read printerIp
    else
        echo $printerIp
    fi
}

check_parameters() {
    printf "\nStarted checking parameters...\n"
    valid="true"

    echo "Parameters:"
    echo "----------------------------------------"
    echo "printerName: $printerName"
    echo "printerIp  : $printerIp"
    echo "----------------------------------------"

    if [ -z $printerName ]; then 
        tput setaf 1; echo "printerName is not set."; tput sgr0
        valid="false"
    fi

    if [ -z $printerIp ]; then 
        tput setaf 1; echo "printerIp is not set."; tput sgr0
        valid="false"
    fi

    echo "Finished checking parameters."

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
add_printer() {
    printf "\nAdd printer on Mac.\n"
    check_os_for_mac

    get_printer_name
    get_printer_ip
    check_parameters
    
    start=$(date +%s)
    echo "The printer(s) on this Mac are: "
    lpstat -p

    printf "\nStarted adding printer..."

    /usr/sbin/lpadmin -p $printerName -E -v lpd://$printerIp/$printerName -D $printerName -P /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Versions/A/Resources/Generic.ppd 

    tput setaf 2; echo "Finished adding printer."; tput sgr0
    echo ""
    echo "The printer(s) on this Mac are: "
    lpstat -p

    end=$(date +%s)
    duration=$(( $end - $start))
    printf "\nTotal execution time: $duration second(s)"
}

# call main function
add_printer
