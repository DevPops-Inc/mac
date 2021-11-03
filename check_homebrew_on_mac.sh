#!/bin/bash 

check_os_for_mac() {

	echo "Started checking operating system at $(date)"

	if [[ $OSTYPE == 'darwin'*  ]]; then
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
	printf "\nCheck Homebrew on Mac.\n\n"
	check_os_for_mac

	start=$(date +%s)
	echo "Starting checking Homebrew at $(date)"

	which -s brew
	if [[ $? != 0 ]]; then
		tput setaf 1; echo "Homebrew needs to be installed."; tput sgr0
		echo "Would you like to install Homebrew now?"
		read -p "Please type Y or N and press \"return\" key:" answer

		if [[ $answer == 'Y' ]]; then
			echo "Started installing Homebrew at $(date)"
			
			mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

			/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

			brew --version
			tput setaf 2; echo "Successfully installed Homebrew."; tput sgr0

			end=$(date +%s)
			echo "Finished checking Homebrew at $(date)"

			duration=$(( $end - $start ))
			echo "Total execution time: $duration second(s)"
		else
			echo "Exiting script now."

			end=$(date +%s)
			echo "Finished checking Homebrew at $(date)"

			duration=$(( $end - $start ))
			echo "Total execution time: $duration second(s)"
			
			exit 1
		fi
	else
		tput setaf 2; echo "Homebrew is installed."; tput sgr0

		end=$(date +%s)
		echo "Finished checking Homebrew at $(date)"

		duration=$(( $end - $start ))
		echo "Total execution time: $duration second(s)"
	fi
}

check_homebrew
