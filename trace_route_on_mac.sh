#!/bin/bash
set -e

# trace route on Mac

# you can run this script with: ./trace_route_on_mac.sh < domain > 

domain=$1

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo "Operating System:\n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

get_domain() {
    if [ -z $domain ]; then 
        read -p "Please type the domain you would like to trace and press \"return\" kay (Example: apple.com): " domain

        echo ""
    else 
        echo $domain &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameters at $(date)"
    valid="true"

    echo "Parameters:"
    echo "---------------"
    echo "domain: $domain"
    echo "---------------"

    if [ -z $domain ]; then 
        tput setaf 1; echo "domain is not set."; tput sgr0
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

trace_route() {
    printf "\nTrace route on Mac.\n\n"
    check_os_for_mac

    get_domain
    check_parameters

    start=$(date +%s)
    echo "Started tracing route at $(date)"

    traceroute $domain
    tput setaf 2; echo "Successfully traced route."; tput sgr0

    end=$(date +%s)
    echo "Finished tracing route at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

trace_route
