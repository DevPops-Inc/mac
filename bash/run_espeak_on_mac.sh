#!/bin/bash

# run eSpeak on Mac

# you can run this script with: ./run_espeak_on_mac.sh "< talk string >""

talkString=$1

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

check_espeak() {
    echo "Started checking eSpeak at $(date)"

    which -s espeak
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "eSpeak is installed."; tput sgr0
        espeak --version

        echo "Finished checking eSpeak at $(date)"
        echo ""
    else 
        tput setaf 1; echo "eSpeak is not installed."; tput sgr0

        echo "Finished checking eSpeak at $(date)"
        echo ""

        exit 1
    fi
}

get_talk_string() {
    if [ -z "${talkString}" ]; then 
        read -p "Please type what you want eSpeak to say and press \"return\" key (Example: \"Warriors, come out and play!\"): " talkString

        echo ""
    else
        echo talkString &>/dev/null 
    fi
}

check_parameters() {
    echo "Started checking parameter(s) at $(date)"
    valid="true"

    echo "Parameter(s):"
    echo "-----------------------"
    echo "talkString: ${talkString}"
    echo "-----------------------"

    if [ -z "${talkString}" ]; then 
        tput setaf 1; echo "talkString is not set."; tput sgr0
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

        exit 1
    fi
}

run_espeak() {
    printf "\nRun eSpeak on Mac.\n\n"
    
    check_os_for_mac
    check_espeak

    get_talk_string
    check_parameters

    start=$(date +%s)
    echo "Started running eSpeak at $(date)"

    espeak "${talkString}"
    tput setaf 2; echo "Successfully ran eSpeak."; tput sgr0

    end=$(date +%s)
    echo "Finished running eSpeak at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

run_espeak
