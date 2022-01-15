#!/bin/bash
set -e

# install Terraform with Homebrew

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

check_terraform() {
    echo "Started checking Terraform at $(date)"

    if [ -d $(which terraform) ]; echo $? == 0 &>/dev/null
    then
        tput setaf 2; echo "Terraform is installed."; tput sgr0
        terraform --version

        echo "Finished checking Terraform at $(date)"
        echo ""

        exit 0
    else 
        tput setaf 1; echo "Terraform is not installed."; tput sgr0

        echo "Finished checking Terraform at $(date)"
        echo ""
    fi
}

check_homebrew() {
    echo "Started checking Homebrew at $(date)"

    which -s brew
    if [[ $? != 0 ]]; then 
        tput setaf 1; echo "Hombrew needs to be installed."; tput sgr0

        echo "Finished checking Homebrew at $(date)"
        echo ""

        exit 1
    else 
        tput setaf 2; echo "Homebrew is installed."; tput sgr0
        brew --version

        echo "Finished checking Homebrew at $(date)"
        echo ""
    fi
}

install_terraform() {
    printf "\nInstall Terraform with Homebrew.\n\n"

    check_os_for_mac
    check_terraform
    check_homebrew

    start=$(date +%s)
    echo "Started installing Terraform at $(date)"

    brew install terraform
    tput setaf 2; "Successfully installed Terraform."; tput sgr0
    terraform --version

    end=$(date +%s)
    echo "Finished installing Terraform at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

install_terraform
