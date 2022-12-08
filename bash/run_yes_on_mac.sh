#!/bin/bash

# run yes on Mac

# you can run this script with: ./run_yes_on_mac.sh "< textString >"

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

check_yes() {
    echo "Started checking yes at $(date)"

    which -s yes
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "yes is installed."; tput sgr0

        echo "Finished checking yes at $(date)"
        echo ""
    else 
        tput setaf 1; echo "yes is not installed."; tput sgr0

        echo "Finished checking yes at $(date)"
        echo ""

        exit 1
    fi
}

get_text_string() {
    if [ -z "${textString}" ]; then 
        read -p "Please type the text string and press \"return\" key (Example: My heart's a stereo): " textString

        echo ""
    else 
        echo "${textString}" &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameter(s) at $(date)"
    valid="true"

    echo "Parameter(s):"
    echo "-------------------------"
    echo "textString: ${textString}"
    echo "-------------------------"

    if [ -z "${textString}" ]; then 
        tput setaf 1; echo "textString is not set."; tput sgr0
        valid="false"
    fi

    if [ $valid == "true" ]; then 
        tput setaf 2; echo "All parameter check(s) passed."; tput sgr0

        echo "Finished checking parameter(s) at $(date)"
        echo ""
    else 
        tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0

        echo "Finished checking parameter(s) at $(date)"
        echo ""
    fi
}

run_yes() {
    printf "\nRun yes on Mac.\n\n"

    check_os_for_mac
    check_yes

    get_text_string
    check_parameters

    start=$(date +%s)
    echo "Started running yes at $(date)"

    echo "Press \"control\" and \"C\" when you're ready to quit running yes."
    yes "${textString}"
    tput setaf 2; echo "Successfully ran yes."; tput sgr0

    end=$(date +%s)
    echo "Finished running yes at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo 
}

run_yes
