#!/bin/bash
set -e

# remove file on Mac

# you can run this script with: ./remove_file_on_mac.sh < file path > 

filePath=$1

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

get_file_path() {
    if [ -z $filePath ]; then 
        read -p "Please type the path of the file you wish to remove and press \"return\" key (Example: /Users/$USER/Desktop/foo.txt): " filePath

        echo ""
    else 
        echo $filePath &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameter(s) at $(date)"
    valid="true"

    echo "Parameter(s):"
    echo "-------------------"
    echo "filePath: $filePath"
    echo "-------------------"

    if [ -z $filePath ]; then 
        tput setaf 1; echo "filePath is not set."; tput sgr0
        valid="false"
    fi

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

remove_file() {
    printf "\nRemove file on Mac.\n\n"
    check_os_for_mac

    get_file_path
    check_parameters

    start=$(date +%s)
    echo "Started removing file at $(date)"

    printf "Removing: "; rm -v $filePath
    tput setaf 2; echo "Successfully removed: $filePath"; tput sgr0

    end=$(date +%s)
    echo "Finisehd removing file at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

remove_file
