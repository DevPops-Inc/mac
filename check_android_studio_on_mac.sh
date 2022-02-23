#!/bin/bash

# check Android Studio on Mac

desktopApp="Android Studio"

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

get_desktop_app() {
	if [ -z $desktopApp ]; then 
		read -p "Please type the name of the desktop app you want to check and prss \"return\" key (Example: Android Studio): " desktopApp

		echo ""
	else 
		echo $desktopApp
	fi
}

check_parameters() {
	echo "Started checking parameters at $(date)"
	valid="true"

	echo "Parameters:"
	echo "-----------------------"
	echo "desktopApp: $desktopApp"
	echo "-----------------------"

	if [ -z "$desktopApp" ]; then 
		tput setaf 1; echo "desktopApp is not set."; tput sgr0
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

check_desktop_app() {
	printf "\nCheck $desktopApp on Mac.\n\n"
	check_os_for_mac

	get_desktop_app
	check_parameters

	start=$(date +%s)
	echo "Started checking $desktopApp at $(date)"

	if open -Ra "$desktopApp"; then
		tput setaf 2; echo "$desktopApp is installed"; tput sgr0
		open -a "$desktopApp.app"

		end=$(date +%s)
		echo "Finished checking $desktopApp at $(date)"
		
		duration=$(( $end - $start ))
		echo "Total execution time: $duration second(s)"
		echo ""
	else
		tput setaf 1; echo "$desktopApp is not installed"; tput sgr0
		
		end=$(date +%s)
		echo "Finished checking $desktopApp at $(date)"
		
		duration=$(( $end - $start ))
		echo "Total execution time: $duration second(s)"
		echo ""
		
		exit 1
	fi
}

check_desktop_app
