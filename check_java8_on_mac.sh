#!/bin/bash

# check Java 8 on Mac

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
	printf "\nCheck Java 8 on Mac.\n\n"
	check_os_for_mac

	start=$(date +%s)
	echo "Started checking Java 8 at $(date)"

	if [ -d "/Library/Java/JavaVirtualMachines/*8*jdk" ]; echo $? == 0 &>/dev/null
	then
		tput setaf 2; echo "Java 8 is installed."; tput sgr0
		java -version

		end=$(date +%s)
		echo "Finished checking Java 8 at $(date)"

		duration=$(( $end - $start ))
		echo "Total execution time: $duration second(s)"
		echo ""
	else
		tput setaf 1; echo "Java 8 needs to be installed."; tput sgr0

		end=$(date +%s)
		echo "Finished checking Java 8 at $(date)"

		duration=$(( $end - $start ))
		echo "Total execution time: $duration second(s)"
		echo ""
	fi
}

check_java8
