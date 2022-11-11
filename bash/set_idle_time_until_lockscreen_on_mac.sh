#!/bin/bash
set -e

# set lockscreen time on Mac

# you can run this script with: ./set_idle_time_until_lockscreen_on_mac.sh < seconds idle lockscreen > 

idleTimeInSeconds=$1

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

get_idle_time() {
    if [ -z $idleTimeInSeconds ]; then 
        read -p "Please type the idle time in seconds and press \"return\" key (Example: 900): " idleTimeInSeconds

        echo ""
    else
        echo $idleTimeInSeconds &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameters at $(date)"
    valid="true"

    echo "Parameters:"
    echo "-------------------------------------"
    echo "idleTimeInSeconds: $idleTimeInSeconds"
    echo "-------------------------------------"

    if [ -z $idleTimeInSeconds ]; then 
        tput setaf 1; echo "idleTimeInSeconds is not set."; tput sgr0
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

        exit 1
    fi
}

set_idle_time_until_lockscreen() {
    printf "\nSet idle time until lockscreen on Mac.\n\n"
    check_os_for_mac

    get_idle_time
    check_parameters

    start=$(date +%s)
    echo "Started setting idle time until lockscreen at $(date)"

    gsettings set org.gnome.desktop.session idle-delay $idleTimeInSeconds
    tput setaf 2; echo "Successfully set idle time before lockscreen."; tput sgr0

    end=$(date +%s)
    echo "Finished setting idle time until lockscreen at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

set_idle_time_until_lockscreen
