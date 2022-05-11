#!/bin/bash 

# install deviceconsole with NPM on Mac

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

check_deviceonsole() {
    echo "Started checking deviceconsole at $(date)"

    which -s deviceconsole
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "deviceconsole is installed."; tput sgr0

        echo "Finished checking deviceconsole at $(date)"
        echo ""

        exit 0
    else 
        tput setaf 1; echo "deviceconsole is not installed."; tput sgr0

        echo "Finished checking deviceconsole at $(date)"
        echo ""
    fi
}

check_npm() {
    echo "Started checking NPM at $(date)"

    which -s npm
    if [[ $? == 0 ]]; then
        tput setaf 2; echo "NPM is installed."; tput sgr0
        npm --version

        echo "Finished checking NPM at $(date)"
        echo ""
    else
        tput setaf 1; echo "NPM is not installed."; tput sgr0

        echo "Finished checking NPM at $(date)"
        echo ""

        exit 1
    fi
}

install_deviceconsole() {
    printf "\nInstall deviceconsole with NPM on Mac.\n\n"

    check_os_for_mac
    check_deviceonsole
    check_npm

    start=$(date +%s)
    echo "Started installing deviceconsole at $(date)"

    npm install -g deviceconsole
    tput setaf 2; echo "Successfully installed deviceconsole."; tput sgr0
    
    end=$(date +%s)
    echo "Finished installing deviceconsole at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

install_deviceconsole
