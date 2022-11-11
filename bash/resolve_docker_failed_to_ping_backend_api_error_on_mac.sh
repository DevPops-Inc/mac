#!/bin/bash

# resolve Docker failed to ping backend API error on Mac

# you can run this script with: ./resolve_docker_failed_to_pring_backend_api_error_on_mac.sh < Docker process ID > 

dockerPid=$1

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

get_docker_process_id() {
    if [ -z $dockerPid ]; then 
        echo "Please press control and C keys to stop process after you find Docker's process ID."

        top | grep "Docker"

        read -p "Please type the process ID for Docker (Example: 599): " dockerPid
        echo ""
    else 
        echo $dockerPid &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameters at $(date)"
    valid="true"

    echo "Parameters:"
    echo "---------------------"
    echo "dockerPid: $dockerPid"
    echo "---------------------"

    if [ -z $dockerPid ]; then 
        tput setaf 1; echo "dockerPid is not set."; tput sgr0
        valid="false"
    fi

    if [ $valid == "true" ]; then 
        tput setaf 2; echo "All parameters checks passed."; tput sgr0

        echo "Finished checking parameters at $(date)"
        echo ""
    else 
        tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0

        echo "Finished checking parameters at $(date)"
        echo ""
    fi
}

resolve_docker_error() {
    printf "\nResolve Docker failed to ping backend API error on Mac.\n\n"
    check_os_for_mac

    get_docker_process_id
    check_parameters

    start=$(date +%s)
    echo "Started resolving Docker error at $(date)"

    kill $dockerPid
    open -a Docker.app
    tput setaf 2; echo "Successfully resolved Docker error."; tput sgr0

    end=$(date +%s)
    echo "Finished resolving Docker error at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

resolve_docker_error
