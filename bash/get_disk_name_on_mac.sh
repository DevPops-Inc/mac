#!/bin/bash 

# get disk name on Mac

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

get_disk_name() {
    printf "\nGet disk name on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started getting disk name at $(date)"

    diskutil list | grep "MacOS"
    if [[ $? == 0 ]]; then 
        tput setaf 4; echo "Disk name is MacOS."
    fi
    
    diskutil list | grep "Macintosh HD"
    if [[ $? == 0 ]]; then 
        tput setaf 4; echo "Disk name is Macintosh HD."
    fi

    tput setaf 2; echo "Successfully got disk name."; tput sgr0

    end=$(date +%s)
    echo "Finished getting disk name at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

get_disk_name
