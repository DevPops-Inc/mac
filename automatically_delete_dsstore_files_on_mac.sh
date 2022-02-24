#!/bin/bash
set -e

# automatically delete DS_Store files on Mac

# you can run this script with: ./automatically_delete_dsstore_files_on_mac.sh < hours interval > 

hours=$1 # you can set the hours here (Example: 24)

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

get_hours() { 
    if [ -z $hours ]; then 
        read -p "Please type how many hours intervals you would like between deleting .DS_Store files and press \"return\" key (Example: 24): " hours

        echo ""
    else 
        echo $hours &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameters at $(date)"
    valid="true"

    echo "Parameters:"
    echo "-------------"
    echo "hours: $hours" 
    echo "-------------"

    if [ -z $hours ]; then 
        tput setaf 1; echo "hours is not set."; tput sgr0
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

# define main fucntion
delete_ds_store_files() {
    printf "\nAutomatically delete DS_Store files on Mac.\n\n"
    check_os_for_mac

    get_hours
    check_parameters

    echo "Started automatically deleting DS_Stores files at $(date)"
    start=$(date +%s)

    # configure cron job interval for automatic deletion of .DS_Store files
    crontab -e
    * $hours * * * root find / -name ".DS_Store" -depth -exec rm {} \;

    tput setaf 2; echo "Successfully set automatica deletion of DS_Store files."; tput sgr0

    end=$(date +%s)
    echo "Finished automatically deleting DS_Store files at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

# call main function 
delete_ds_store_files
