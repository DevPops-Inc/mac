#!/bin/bash

# uninstall Ansible with PIP on Mac

check_os_for_mac() {
        echo "Started checking operating system at $(date)"        
        
        if [[ $OSTYPE == 'darwin'* ]]; then 
                tput setaf 2; echo -e "Operating System:\n$(sw_vers)"; tput sgr0

                echo "Finished checking operating system at $(date)"
                echo ""
        else 
                echo "Finished checking operating system at $(date)"
                echo ""
        fi
}

check_ansible() {
        echo "Started checking Ansible at $(date)"

        which -s ansible
        if [[ $? == 0 ]]; then 
                tput setaf 2; echo "Ansible is installed."; tput sgr0

                echo "Finished checking Ansible at $(date)"
                echo ""
        else 
                tput setaf 1; echo "Ansible is not installed."; tput sgr0

                echo "Finished checking Ansible at $(date)"
                echo ""

                exit 1
        fi
}

check_pip() {
        echo "Started checking PIP at $(date)"

        which -s pip
        if [[ $? == 0 ]]; then
                tput setaf 2; echo "PIP is installed."; tput sgr0

                echo "Finished checking PIP at $(date)"
                echo ""
        else 
                tput setaf 1; echo "PIP is not installed."; tput sgr0

                echo "Finished checking PIP at $(date)"
                echo ""

                exit 1
        fi
}

uninstall_ansible_with_pip() {
        printf "\nUninstall Ansible with PIP"
        
        check_os_for_mac
        check_ansible
        check_pip

        start=$(date +%s)
        echo "Started uninstalling Ansible at $(date)"

        echo -ne 'y' | pip uninstall ansible 
        ansible --version 
        tput setaf 2; echo "Successfully uninstalled Ansible."; tput sgr0

        end=$(date +%s)
        echo "Finished uninstalling Ansible at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
}

uninstall_ansible_with_pip
