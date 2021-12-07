#!/usr/bin/env bash
set -e

# flush DNS cache on Mac

check_os_for_mac() {

    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0
        
        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

flush_dns_cache() {
    printf "\nFlush DNS cache on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started flushing DNS cache at $(date)"

    dscacheutil -flushcache

    tput setaf 2; echo "Successfully flushed DNS cache."; tput sgr0

    end=$(date +%s)
    echo "Finished flushing DNS cache at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

flush_dns_cache
