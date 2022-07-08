#!/bin/bash

# run TOIlet metal on Mac

# you can run this script with: ./run_toilet_metal_on_mac.sh "< text string >"" 

textString=$1

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

check_toilet() {
    echo "Started checking TOIlet at $(date)"

    which -s toilet
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "TOIlet is installed."; tput sgr0

        echo "Finished checking TOIlet at $(date)"
        echo ""
    else 
        tput setaf 1; echo "TOIlet is not installed."; tput sgr0

        echo "Finished checking TOIlet at $(date)"
        echo ""

        exit 1
    fi
}

get_text_string() {
    if [ -z "${textString}" ]; then 
        read -p "Please type the text string and press \"return\" key (Example: We're in heaven): " textString

        echo ""
    else 
        echo "${textString}" &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameters at $(date)"
    valid="true"

    echo "Parameters:"
    echo "-------------------------"
    echo "textString: ${textString}"
    echo "-------------------------"

    if [ -z "${textString}" ]; then 
        tput setaf 1; echo "textString is not set."; tput sgr0
        valid="false"
    fi

    if [ $valid == "true" ]; then 
        tput setaf 2; echo "All parameter checks passed."; tput sgr0

        echo "Finished checking parameters at $(date)"
        echo ""
    else 
        tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0

        echo "Finished checking parameters at $(date)"
        echo ""
    fi
}

run_toilet_metal() {
    printf "\nRun TOIlet metal on Mac.\n\n"

    check_os_for_mac
    check_toilet

    get_text_string
    check_parameters

    start=$(date +%s)
    echo "Started running TOIlet metal at $(date)"

    toilet -f mono12 -F metal "${textString}"
    tput setaf 2; echo "Successfully ran TOIlet metal."; tput sgr0

    end=$(date +%s)
    echo "Finished running TOIlet metal at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

run_toilet_metal
