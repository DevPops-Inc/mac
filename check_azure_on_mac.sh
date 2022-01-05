#!/bin/bash

# check Azure on Mac

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
	fi
}

check_azure() {
    printf "\nCheck Azure on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
	echo "Started checking Azure at $(date)"

	if [ -d $(which az) ]; echo $? == 0 &>/dev/null
	then 
		tput setaf 2; echo "Azure is installed."; tput sgr0

        end=$(date +%s)
		echo "Finished checking Azure at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
		echo ""
	else 
		tput setaf 1; echo "Azure is not installed."; tput sgr0

        end=$(date +%s)
		echo "Finished checking Azure at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
		echo ""

        exit 1
	fi
}

check_azure
