#!/bin/bash
set -e 

# install pgzero module with PIP on Mac

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating System:\n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operatign system at $(date)"
        echo ""
    fi
}

check_pgzero_module () {
    echo "Started checking pgzero module at $(date)"

    if python3 -c "import pgzero" >/dev/null 2>&1; then
        tput setaf 2; echo "pgzero is installed."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 0
    else 
        tput setaf 1; echo "pgzero is not installed."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    fi
}

check_pip() {
    echo "Started checking PIP at $(date)"

    if which -s pip; then 
        tput setaf 2; echo "PIP is installed."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "PIP is not installed."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

install_pgzero_module_with_pip() {
    printf "\nInstall pgzero module with PIP on Mac.\n\n"

    check_os_for_mac
    check_pgzero_module
    check_pip

    start=$(date +%s)
    echo "Started installing pgero module at $(date)"

    python3 -m pip install pgzero
    python3 -c "import pgzero" >/dev/null 2>&1
    tput setaf 2; echo "Successfully installed pgzero module."; tput sgr0

    end=$(date +%s)
    echo "Finished installing pgzero module $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

install_pgzero_module_with_pip
