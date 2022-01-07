#!/bin/bash 

# install Chrome with Homebrew

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
	echo "Started checking Chrome at $(date)"

	if open -Ra "Google Chrome"; then
		tput setaf 2; echo "Google Chrome is installed."; tput sgr0

		open -a "Google Chrome.app"

		echo "Finished checking Chrome at $(date)"
		echo ""

		exit 0
	else
		tput setaf 2; echo "Google Chrome is not installed."; tput sgr0

		echo "Finished checking Chrome at $(date)"
		echo ""
	fi
}

check_homebrew() {
	echo "Started checking Homebrew at $(date)"

	which -s brew
	if [[ $? != 0 ]]; then
		tput setaf 1; echo "Homebrew needs to be installed."; tput sgr0

		echo "Finished checking Homebrew at $(date)"
		echo ""

		exit 1
	else
		tput setaf 2; echo "Homebrew is installed."; tput sgr0

		echo "Finished checking Homebrew at $(date)"
		echo ""
	fi
}

install_chrome() {
	printf "\nInstall Chrome with Homebrew.\n\n"

	check_os_for_mac
	check_chrome
	check_homebrew

	start=$(date +%s)
	echo "Starting to install Chrome at $(date)"

	brew --cask google-chrome

	tput setaf 2; echo "\nSuccessfully installed Chrome."; tput sgr0
	
	end=$(date +%s)
	echo "Finished installing Chrome at $(date)"

	duration=$(( $end - $start ))
	echo "Total execution time: $duration second(s)"
	echo ""
}

install_chrome
