#!/bin/bash 

# install carthage with Homebrew 

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

check_carthage() {
	echo "Started checking carthage at $(date)"

	if [ -d $(which carthage) ]; echo $? == 0 &>/dev/null
	then 
		tput setaf 2; echo "carthage is installed."; tput sgr0

		echo "Finished checking carthage at $(date)"
		echo ""

		exit 0
	else 
		tput setaf 1; echo "carthage is not installed."; tput sgr0

		echo "Finished checking carthage at $(date)"
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

install_carthage() {
	printf "\nInstall carthage with Homebrew.\n\n"

	check_os_for_mac
	check_carthage
	check_homebrew

	start=$(date +%s)
	echo "Started installing carthage at $(date)"

	brew install carthage

	tput setaf 2; echo "Successfully installed carthage."; tput sgr0

	end=$(date +%s)
	echo "Finished installing carthage at $(date)"

	duration=$(( $end - $start ))
	echo "Total execution time: $duration second(s)"
	echo ""
}

install_carthage
