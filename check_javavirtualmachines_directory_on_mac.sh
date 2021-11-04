#!/bin/bash

# check Java Virtual Machines directory on Mac

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

check_java_virtual_machines_directory() {
	printf "\nCheck Java Virtual Machines Directory on Mac.\n\n"
	check_os_for_mac

	start=$(date +%s)
	echo "Started checking Java Virtual Machines directory at $(date)"

	if [ ! -d "/Library/Java/JavaVirtualMachines" ]; then 
		echo "/Library/Java/JavaVirtualMachines directory doesn't exist so creating it now"
		
		sudo mkdir -p /Library/Java/JavaVirtualMachines;
		
		tput setaf 2; echo "Successfully created /Library/Java/JavaVirtualMachines directory."; tput sgr0
		
		echo "--------------------------------------------------"
		du -a /Library/Java/JavaVirtualMachines
		echo "--------------------------------------------------"

		end=$(date +%s)
		echo "Finished checking Java Virtual Machines directory at $(date)"

		duration=$(( $end - $start ))
		echo "Total execution time: $duration second(s)"
	else 
		tput setaf 2; echo "/Library/Java/JavaVirtualMachines directory exists"; tput sgr0
		
		echo "--------------------------------------------------"
		du -a /Library/Java/JavaVirtualMachines
		echo "--------------------------------------------------"

		end=$(date +%s)
		echo "Finished checking Java Virtual Machines directory at $(date)"

		duration=$(( $end - $start ))
		echo "Total execution time: $duration second(s)"

		exit 1
	fi
}

check_java_virtual_machines_directory
