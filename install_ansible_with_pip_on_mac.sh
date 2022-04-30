#!/bin/bash 

# install Ansible with PIP on Mac

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then
        tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

check_ansible() {
    echo "Started checking Ansible at $(date)"

    which -s ansible
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "Ansible is installed."; tput sgr0
        ansible --version

        echo "Finished checking Ansible at $(date)"
        echo ""

        exit 0
    else 
        tput setaf 1; echo "Ansible is not installed."; tput sgr0

        echo "Finished checking Ansible at $(date)"
        echo ""
    fi
}

check_pip() {
    echo "Started checking PIP at $(date)"

    which -s pip
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "PIP is installed."; tput sgr0
        pip --version 

        echo "Finished checking PIP at $(date)"
        echo ""
    else
        tput setaf 1; echo "PIP is not installed."; tput sgr0

        echo "Finished checking PIP at $(date)"
        echo ""

        exit 1
    fi
}

install_ansible() {
    printf "\nInstall Ansible with PIP on Mac.\n\n"
    
    check_os_for_mac
    check_ansible
    check_pip

    start=$(date +%s)
    echo "Started installing Ansible at $(date)"

    pip install ansible 
    ansible --version 

    end=$(date +%s)
    echo "Finished installing Ansible at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

install_ansible
