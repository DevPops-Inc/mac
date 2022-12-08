#!/bin/bash 

# check Homebrew 

terminalApp="brew"

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

get_terminal_app() {
	if [ -z $terminalApp ]; then 
		read -p "Please type the terminal application you would like to check and press \"return\" key (Example: brew): " terminalApp

		echo ""
	else 
		echo $terminalApp &>/dev/null
	fi
}

check_parameters() {
	echo "Started checking parameter(s) at $(date)"
	valid="true"

	echo "Parameter(s):"
	echo "-------------------------"
	echo "terminalApp: $terminalApp"
	echo "-------------------------"

	if [ -z $terminalApp ]; then 
		tput setaf 1; echo "terminalApp is not set."; tput sgr0
		valid="false"
	fi

	if [ $valid == "true" ]; then 
		tput setaf 2; echo "All parameter check(s) passed."; tput sgr0

		echo "Finished checking parameter(s) at $(date)"
		echo ""
	else
		tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0

		echo "Finished checking parameter(s) at $(date)"
		echo ""

		exit 1
	fi
}

check_terminal_app() {
	printf "\nCheck $terminalApp on Mac.\n\n"
	check_os_for_mac

	get_terminal_app
	check_parameters

	start=$(date +%s)
	echo "Starting checking $terminalApp at $(date)"

	which -s $terminalApp
	if [[ $? == 0 ]]; then
		tput setaf 2; echo "$terminalApp is installed."; tput sgr0
		$terminalApp --version
		tput setaf 2; echo "Successfully checked $terminalApp."; tput sgr0

		end=$(date +%s)
		echo "Finished checking $terminalApp at $(date)"

		duration=$(( $end - $start ))
		echo "Total execution time: $duration second(s)"
		echo ""
	else
		tput setaf 1; echo "$terminalApp needs to be installed."; tput sgr0
		tput setaf 2; echo "Successfully checked $terminalApp."; tput sgr0

		echo "Would you like to install $terminalApp now?"
		read -p "Please type Y or N and press \"return\" key:" answer

		if [[ $answer == 'Y' || 'y' ]]; then
			echo "Started installing $terminalApp at $(date)"
			
			mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

			/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

			brew --version
			tput setaf 2; echo "Successfully installed $terminalApp."; tput sgr0

			end=$(date +%s)
			echo "Finished checking $terminalApp at $(date)"

			duration=$(( $end - $start ))
			echo "Total execution time: $duration second(s)"
			echo ""
		else
			echo "Exiting script now."

			end=$(date +%s)
			echo "Finished checking $terminalApp at $(date)"

			duration=$(( $end - $start ))
			echo "Total execution time: $duration second(s)"
			echo ""
			
			exit 1
		fi
	fi
}

check_terminal_app
