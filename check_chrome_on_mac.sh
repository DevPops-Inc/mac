#!/bin/bash

# check Chrome on Mac

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

check_chrome() {
	printf "\nCheck Chrome on Mac.\n\n"

    start=$(date +%s)
    echo "Started checking Chrome at $(date)"

	if open -Ra "Google Chrome"; then
		tput setaf 2; echo "Google Chrome is installed."; tput sgr0

		open -a "Google Chrome.app"

        end=$(date +%s)
		echo "Finished checking Chrome at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
		echo ""

		exit 0
	else
		tput setaf 2; echo "Google Chrome is not installed."; tput sgr0

        end=$(date +%s)
		echo "Finished checking Chrome at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
		echo ""
	fi
}

check_chrome
