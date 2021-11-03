#!/bin/bash

# check Android Studio on Mac

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

check_android_studio() {
	printf "\nCheck Android Studio on Mac.\n\n"
	check_os_for_mac

	start=$(date +%s)
	echo "Started checking Android Studio at $(date)"

	if open -Ra "Android Studio"; then
		tput setaf 2; echo "Android Studio is installed"; tput sgr0
		
		end=$(date +%s)
		echo "Finished checking Android Studio at $(date)"
		
		duration=$(( $end - $start ))
		echo "Total execution time: $duration second(s)"
	else
		tput setaf 1; echo "Android Studio is not installed"; tput sgr0
		
		end=$(date +%s)
		echo "Finished checking Android Studio at $(date)"
		
		duration=$(( $end - $start ))
		echo "Total execution time: $duration second(s)"
		
		exit 1
	fi
}

check_android_studio
