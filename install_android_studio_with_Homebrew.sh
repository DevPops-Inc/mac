#!/bin/bash

# install Android Studio with Homebrew

check_os_for_mac() {

	echo "Started checking operating system at $(date)"

	if [[ $OSTYPE == 'darwin'* ]]; then 
		tput setaf 2; echo -e "Operating system: \n$(sw_vers)"; tput sgr0

		echo "Finished checking operating system at $(date)"
		echo ""
	else 
		tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

		echo "Finished checking operating system at $(date)"
		echo ""
	fi
}

check_android_studio() {
	echo "Started checking Android Studio at $(date)"

	if open -Ra "Android Studio"; then
		tput setaf 2; echo "Android Studio is installed."; tput sgr0

		echo "Finished checking Android Studio at $(date)"
		echo ""

		exit 1
	else
		echo "Android Studio is not installed."

		echo "Finished checking Android Studio at $(date)"
		echo ""
	fi
}

check_homebrew() {
	echo "Started checking Homebrew at $(date)"

	which -s brew
	if [[ $? != 0 ]]; then
		tput setaf 1; echo "Homebrew needs to be installed."; tput sgr0
		exit 1
	else
		tput setaf 2; echo "Homebrew is installed."; tput sgr0
	fi

	echo "Finished checking Homebrew at $(date)"
	echo ""
}

install_android_studio() {
	printf "\nInstall Android Studio with Homebrew.\n\n"
	
	check_os_for_mac
	check_android_studio
	check_homebrew

	start=$(date +%s)
	echo "Started installing Android Studio at $(date)"

	brew install --cask android-studio
	brew install android-sdk

	tput setaf 2; echo "Successfully installed Android Studio."; tput sgr0

	end=$(date +%s)
	echo "Finished installing Android Studio at $(date)"

	duration=$(( $end - $start ))
	echo "Total execution time: $duration second(s)"
	echo ""
}

install_android_studio
