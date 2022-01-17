#!/bin/bash 

# check ios-deploy on Mac

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
            tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0

            echo "Finished checking operating system at $(date)"
            echo ""
    else 
            tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

            echo "Finisehd checking operating system at $(date)"
            echo ""
    fi
}

check_ios-deploy() {
    printf "\nCheck ios-deploy on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started checking ios-deploy at $(date)"

    if [ -d $(which ios-deploy) ]; echo $? == 0 &>/dev/null
    then 
            tput setaf 2; echo "ios-deploy is installed."; tput sgr0
            ios-deploy --version
            
            end=$(date +%s)
            echo "Finished checking ios-deploy at $(date)"

            duration=$(( $end - $start ))
            echo "Total execution time: $duration second(s)"
            echo ""

            exit 0
    else 
            tput setaf 1; echo "ios-deploy is not installed."; tput sgr0

            end=$(date +%s)
            echo "Finished checking ios-deploy at $(date)"

            duration=$(( $end - $start ))
            echo "Total execution time: $duration second(s)"
            echo ""
    fi
}

check_ios-deploy
