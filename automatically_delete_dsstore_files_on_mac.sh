#!/bin/bash
set -e

# automatically delete DS_Store files on Mac

# you can run this script with: ./automatically_delete_dsstore_files_on_mac.sh < hourss interval > 

hours=$1

get_hours() { 
    if [ -z $hours ]; then 
        printf "\nPlease type how many hours intervals you would like between deleting .DS_Store files (Example: 24): "

        read hours
    else 
        echo $hours
    fi
}

check_parameters() {
    printf "\nStarted checking parameters at $(date)\n"
    valid="true"

    echo "Parameters:"
    echo "----------------------------------------"
    echo "hours: $hours" 
    echo "----------------------------------------"

    if [ -z $hours ]; then 
        tput setaf 1; echo "hours is not set."; tput sgr0
        valid="false"
    fi

    echo "Finished checking parameters at $(date)"
    
    if [ $valid == "true" ]; then 
        tput setaf 2; echo "All parameter checks passed."; tput sgr0
        echo ""
    else
        tput setaf 1; echo "One or more parameters are incorrect, exiting script."; tput sgr0

        echo ""
        exit 1
    fi
}

# define main fucntion
delete_ds_store_files() {
    printf "\nAutomatically delete DS_Store files on Mac.\n"
    
    get_hours
    check_parameters

    echo "Started automatically deleting DS_Stores files at $(date)"
    start=$(date +%s)

    # configure cronjob
    crontab -e

    # configure time interval for automatic deletion of .DS_Store files
    * $hours * * * root find / -name ".DS_Store" -depth -exec rm {} \;

    tput setaf 2; echo -e "Finished automatically deleting DS_Store at $(date)"; tput sgr0
    end=$(date +%s)

    duration=$(( $end - $start ))
    printf "\nTotal time of execution: $duration second(s)\n"
}

# call main function 
delete_ds_store_files
