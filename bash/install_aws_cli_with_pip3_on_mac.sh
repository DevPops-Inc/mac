#!/bin/bash

# install AWS CLI with PIP3 on Mac

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

check_aws() {
    echo "Started checking AWS at $(date)"

    which -s aws
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "AWS is installed."; tput sgr0

        echo "Finished checking AWS at $(date)"
        echo ""

        exit 0
    else 
        tput setaf 1; echo "AWS is not installed."; tput sgr0

        echo "Finished checking AWS at $(date)"
        echo ""
    fi
}

check_pip3() {
    echo "Started checking PIP3 at $(date)"

    which -s pip3
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "PIP3 is installed."; tput sgr0

        echo "Finished checking PIP3 at $(date)"
        echo ""
    else 
        tput setaf 1; echo "PIP3 is not installed."; tput sgr0

        echo "Finished checking PIP3 at $(date)"
        echo ""

        exit 1
    fi
}

install_aws_cli() {
    printf "\nInstall AWS CLI with PIP3 on Mac.\n\n"

    check_os_for_mac
    check_aws
    check_pip3

    start=$(date +%s)
    echo "Started installing AWS CLI at $(date)"

    pip3 install --upgrade --user awscli 
    aws --version

    end=$(date +%s)
    echo "Finished installing AWS CLI at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

install_aws_cli
