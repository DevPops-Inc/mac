#!/bin/bash
set -e 

# check Java Virtual Machines directory on Mac

javaVmDirectory="/Library/Java/JavaVirtualMachines"

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

get_java_vm_directory() {
	if [ -z "$javaVmDirectory" ]; then 
		read -p "Please type the Java virtual machines directory and press \"return\" key (Example: /Library/Java/JavaVirtualMachines): " javaVmDirectory

		echo ""
	else 
		echo $javaVmDirectory &>/dev/null
	fi
}

check_parameters() {
	echo "Started checking parameter(s) at $(date)"
	valid="true"

	echo "Parameter(s):"
	echo "---------------------------------"
	echo "javaVmDirectory: $javaVmDirectory"
	echo "---------------------------------"

	if [ -z "$javaVmDirectory" ]; then 
		tput setaf 1; echo "javaVmDirectory is not set."; tput sgr0
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
	fi
}

check_java_vm_directory() {
	printf "\nCheck $javaVmDirectory on Mac.\n\n"
	check_os_for_mac

	get_java_vm_directory
	check_parameters

	start=$(date +%s)
	echo "Started checking $javaVmDirectory at $(date)"

	if [ -d "$javaVmDirectory" ]; then 
		tput setaf 2; echo "$javaVmDirectory directory exists"; tput sgr0
		
		echo "-------------"
		ls $javaVmDirectory
		echo "-------------"
		tput setaf 2; echo "Successfully checked $javaVmDirectory."; tput sgr0

		end=$(date +%s)
		echo "Finished checking $javaVmDirectory at $(date)"

		duration=$(( $end - $start ))
		echo "Total execution time: $duration second(s)"
		echo ""
	else 
		echo "$javaVmDirectory directory doesn't exist so creating it now"
		sudo mkdir -p $javaVmDirectory;
		
		echo "-------------"
		ls $javaVmDirectory
		echo "-------------"
		
		tput setaf 2; echo "Successfully created $javaVmDirectory."; tput sgr0

		end=$(date +%s)
		echo "Finished checking $javaVmDirectory at $(date)"

		duration=$(( $end - $start ))
		echo "Total execution time: $duration second(s)"
		echo ""
	fi
}

check_java_vm_directory
