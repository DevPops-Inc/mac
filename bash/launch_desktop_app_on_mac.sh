#!/bin/bash 

# launch desktop application on Mac

# you can run this script with: ./launch_desktop_app_on_mac.sh "< appplication >""

desktopAppName=$1

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

get_desktop_app_name() {
    if [ -z "${desktopAppName}" ]; then 
        echo "The available desktop applications are: "
        ls /Applications
        echo ""
        
        read -p "Please type the desktop application you wish to launch and press \"return\" key (Example: \"Visual Studio Code.app\"): " desktopAppName

        echo ""
    else 
        echo "${desktopAppName}" &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameters at $(date)"
    valid="true"

    echo "Parameters:"
    echo "-------------------------------"
    echo "desktopAppName: ${desktopAppName}"
    echo "-------------------------------"

    if [ -z "${desktopAppName}" ]; then 
        tput setaf 1; echo "desktopAppName is not set."; tput sgr0
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

launch_desktop_app() {
    printf "\nLaunch desktop application on Mac.\n\n"
    check_os_for_mac

    get_desktop_app_name
    check_parameters

    start=$(date +%s)
    echo "Started launching desktop application at $(date)"

    open -a "${desktopAppName}"
    tput setaf 2; echo "Succesfully launched desktop application."; tput sgr0

    end=$(date +%s)
    echo "Finished launching desktop application at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

launch_desktop_app
