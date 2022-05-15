#!/bin/bash 

# install ideviceinstaller with Homebrew

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

check_homebrew() {
	echo "Started checking Homebrew at $(date)"

	which -s brew
	if [[ $? == 0 ]]; then
		tput setaf 2; echo "Homebrew is installed."; tput sgr0
		brew --version

		echo "Finished checking Homebrew at $(date)"
		echo ""
	else
		tput setaf 1; echo "Homebrew needs to be installed."; tput sgr0

		echo "Finished checking Homebrew at $(date)"
		echo ""

		exit 1
	fi
}

install_ideviceinstaller() {
	printf "\nInstall ideviceinstaller with Homebrew\n\n"

	check_os_for_mac
	check_ideviceinstaller
	check_homebrew

	echo "Started installing ideviceinstaller at $(date)"
	start=$(date +%s)

	brew install ideviceinstaller
	ideviceinstaller --version
	tput setaf 2; echo "Successfully installed idevice installer."; tput sgr0
	
	end=$(date +%s)
	echo "Finished installing ideviceinstaller at $(date)"

	duration=$(( $end - $start ))
	echo "Total execution time: $duration second(s)"
	echo ""
}

install_ideviceinstaller
