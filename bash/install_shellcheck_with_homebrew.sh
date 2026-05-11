#!/bin/bash 
set -e

# install Shellcheck with Homebrew

check_os_for_mac() {
	echo "Started checking operating system at $(date)"

	if [[ $OSTYPE == 'darwin'* ]]; then 
		tput setaf 2; echo -e "Operating System:\n$(sw_vers)"; tput sgr0

		echo "Finished checking operating system at $(date)"
		echo ""
	else 
		tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

		echo "Finished checking operating system at $(date)"
		echo ""

		exit 1
	fi
}

check_shellcheck() {
	echo "Started checking shellcheck at $(date)"

	if which -s shellcheck; then 
		tput setaf 2; echo "shellcheck is installed."; tput sgr0
		shellcheck --version 

		echo "Finished checking shellcheck at $(date)"
		echo ""

		exit 0
	else 
		tput setaf 1; echo "shellcheck needs to be installed."; tput sgr0

		echo "Finished chekcing shellcheck at $(date)"
		echo ""
	fi
}

check_homebrew() {
	echo "Started checking Homebrew at $(date)"

	if which -s brew; then
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

install_shellcheck() {
	printf "\nInstall Shellcheck with Homebrew.\n\n"

	check_os_for_mac
	check_shellcheck
	check_homebrew

	start=$(date +%s)
	echo "Started installing Shellcheck at $(date)"

	brew install shellcheck 
	shellcheck --version
	tput setaf 2; echo "Successfully installed Shellcheck."; tput sgr0

	end=$(date +%s)
	tput setaf 2; echo "Finished shellcheck at $(date)"; tput sgr0

	duration=$(( $end - $start ))
	echo "Total execution time: $duration second(s)"
	echo ""
}

install_shellcheck
