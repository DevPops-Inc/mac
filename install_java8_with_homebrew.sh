#!/bin/bash

# install Java 8 with Homebrew

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

check_java8() {
	echo "Started checking Java 8 at $(date)"

	if [ -d "/Library/Java/JavaVirtualMachines/*8*jdk" ]; echo $? == 0 &>/dev/null
	then
		tput setaf 2; echo "Java 8 is installed."; tput sgr0
		java -version

		echo "Finished checking Java 8 at $(date)"
		echo ""

		exit 0
	else
		tput setaf 1; echo "Java 8 needs to be installed."; tput sgr0

		echo "Finished checking Java 8 at $(date)"
		echo ""
	fi
}

check_homebrew() {
	echo "Start checking Homebrew at $(date)"

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

install_java8() {
	printf "\nInstall Java 8 with Homebrew.\n\n"

	check_os_for_mac
	check_java8
	check_homebrew

	start=$(date +%s)
	echo "Started installing Java 8 at $(date)"

	brew install java

	echo $sudo | sudo -S ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk \
	/Library/Java/JavaVirtualMachines/openjdk.jdk

	java -version
	tput setaf 2; echo "Successfully installed Java 8."; tput sgr0

	end=$(date +%s)
	echo "Finished installing Java 8 at $(date)"

	duration=$(( $end - $start ))
	echo "Total execution time: $duration second(s)"
	echo ""
}

install_java8
