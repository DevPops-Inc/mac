#!/bin/bash

# check Ansible on Mac

check_os_for_mac() {

    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then
        tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only works on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    fi 
}

check_ansible() {
    printf "\nCheck Ansible on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started checking Ansible at $(date)"

    which -s ansible
    if [[ $? != 0 ]]; then  
        tput setat 1; echo "Ansible is not installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking Ansible at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""

        exit 1
    else
        tput setaf 2; echo "Ansible is installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking Ansible at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
    fi
}

check_ansible
