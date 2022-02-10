#!/bin/bash 

# check AWS CLI on Mac

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

check_aws_cli() {
    printf "\nCheck AWS CLI on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started checking AWS CLI at $(date)"

    which -s aws
    if [[ $? != 0 ]]; then 
        tput setaf 1; echo "AWS CLI is not installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking AWS CLI at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""

    else 
        tput setaf 2; echo "AWS CLI is installed."; tput sgr0
        aws --version

        end=$(date +%s)
        echo "Finished checking AWS CLI at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""

        exit 0
    fi
}

check_aws_cli
