#!/bin/bash

# install PowerShell with Homebrew

# run this script with: ./install_powershell_on_mac.sh

check_os_for_mac() {
	echo "Started checking operating system at $(date)"

	if [[ $OSTYPE == 'darwin'* ]]; then 
		tput setaf 2; echo "Operating system:\n$(sw_vers)"; tput sgr0

		echo "Finished checking operating system at $(date)"
		echo ""
	else 
		tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0
		
		echo "Finished checking operating system at $(date)"
		echo ""
	fi
}

check_homebrew() {
	echo "Started checking Homebrew at $(date)"

	which -s brew
	if [[ $? == 0 ]]; then
		tput setaf 2; echo "Homebrew is installed."; tput sgr0

		echo "Finished checking Homebrew at $(date)"
		echo ""
	else
		tput setaf 1; echo "Homebrew needs to be installed."; tput sgr0

		echo "Finished checking Homebrew at $(date)"
		echo ""

		exit 1
	fi
}

install_powershell() {
	printf "\nInstall PowerShell with Homebrew.\n\n"
	check_os_for_mac
	check_homebrew

	start=$(date +%s)
	echo "Started installing PowerShell at $(date)"

	brew install --cask powershell
	pwsh --version
	tput setaf 2; echo "Successfully installed Homebrew."; tput sgr0
	
	end=$(date +%s)
	echo "Finished installing PowerShell at $(date)"

	duration=$(( $end - $start ))
	echo "Total execution time: $duration second(s)"
	echo ""
}

install_powershell
