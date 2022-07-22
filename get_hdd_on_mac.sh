#!/bin/bash

# get HDD on Mac

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

get_hdd() {
    printf "\nGet HDD on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started getting HDD at $(date)"

	hdd=$(ls /Volumes)
    tput setaf 4; echo "The HDD is: $hdd"; tput sgr0
    tput setaf 2; echo "Successfully got HDD."; tput sgr0

    end=$(date +%s)
    echo "Finished getting HDD at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

get_hdd
