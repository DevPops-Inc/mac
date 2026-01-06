#!/bin/bash
set -e 

# check colorama module on Mac

module="colorama"

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating System: $(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

get_module() {
    if [ -z "$module" ]; then 
        read -p "Please type the module and press \"return\" key (Example: colorama): " module
        echo ""
    else 
        echo $module &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameter(s) at $(date)"
    valid="true"

    echo "Parameter(s):"
    echo "---------------"
    echo "module: $module"
    echo "---------------"

    if [ -z "$module" ]; then 
        tput setaf 1; echo "module is not set."; tput sgr0
        valid="false"
    fi

    if [ $valid == "true" ]; then 
        tput setaf 2; echo "All parameter check(s) passed."; tput sgr0

        echo "Finished checking parameter(s) at $(date)"
        echo ""
    else 
        tput setaf 1; echo "One or more parameters is incorrect."; tput sgr0

        echo "Finished checking parameter(s) at $(date)"
        echo ""
    fi
}

check_colorama() {
    echo "Started checking $module at $(date)"
    check_os_for_mac

    get_module
    check_parameters

    start=$(date +%s)
    echo "Started checking $module at $(date)"

    if pip list 2>/dev/null | grep -q "$module"; then 
        tput setaf 2; echo "$module is installed"; tput sgr0

        end=$(date +%s)
        echo "Finished checking $module at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
    else 
        tput setaf 1; echo "$module is not installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking $module at $(date)"
        
        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
    fi
}

check_colorama
