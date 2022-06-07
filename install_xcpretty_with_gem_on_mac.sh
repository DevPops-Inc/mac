#!/bin/bash

# install xcpretty with Gem on Mac

check_os_for_mac() {
	echo "Started checking operating system at $(date)"

	if [[ $OSTYPE == 'darwin'* ]]; then 
		tput setaf 2; echo -e "Operating system:\n$(date)"; tput sgr0

		echo "Finished checking operating system at $(date)"
		echo ""
	else 
		tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

		echo "Finished checking operating system at $(date)"
		echo ""

		exit 1
	fi
}

check_xcpretty() {
	echo "Started checking xcpretty at $(date)"

	which -s xcpretty
	if [[ $? == 0 ]]; then 
		tput setaf 2; echo "xcpretty is installed."; tput sgr0
		xcpretty --version
		
		echo "Finished checking xcpretty at $(date)"
		echo ""

		exit 0
	else 
		tput setaf 1; echo "xcpretty is not installed."; tput sgr0

		echo "Finished checking xcpretty at $(date)"
		echo ""	
	fi
}

check_gem() {
	echo "Started checking Gem at $(date)"

	which -s gem
	if [[ $? == 0 ]]; then 
		tput setaf 2; echo "Gem is installed."; tput sgr0
		gem --version

		echo "Finished checking Gem at $(date)"
		echo ""
	else 
		tput setaf 1; echo "Gem is not installed."; tput sgr0

		echo "Finished checking Gem at $(date)"
		echo ""

		exit 1
	fi
}

install_xcpretty_with_gem() {
	printf "\nInstall xcpretty with Gem on Mac.\n\n"

	check_os_for_mac
	check_xcpretty
	check_gem
	
	start=$(date +%s)
	echo "Started installing xcpretty at $(date)"

	sudo gem install xcpretty
	xcpretty --version 
	tput setaf 2; echo "Successfully installed xcpretty at $(date)"; tput sgr0
	
	end=$(date +%s)
	echo "Finished installing xcpretty at $(date)"

	duration=$(( $end - $start ))
	echo "Total execution time: $duration second(s)"
	echo ""
}

install_xcpretty_with_gem
