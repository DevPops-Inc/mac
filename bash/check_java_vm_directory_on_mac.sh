#!/bin/bash
set -e 

# check Java Virtual Machines directory on Mac

javaVmDir="/Library/Java/JavaVirtualMachines"

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

get_java_vm_dir() {
	if [ -z "$javaVmDir" ]; then 
		read -p "Please type the Java virtual machines directory and press \"return\" key (Example: /Library/Java/JavaVirtualMachines): " javaVmDir

		echo ""
	else 
		echo $javaVmDir &>/dev/null
	fi
}

check_parameters() {
	echo "Started checking parameter(s) at $(date)"
	valid="true"

	echo "Parameter(s):"
	echo "---------------------"
	echo "javaVmDir: $javaVmDir"
	echo "---------------------"

	if [ -z "$javaVmDir" ]; then 
		tput setaf 1; echo "javaVmDir is not set."; tput sgr0
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
	printf "\nCheck $javaVmDir on Mac.\n\n"
	check_os_for_mac

	get_java_vm_dir
	check_parameters

	start=$(date +%s)
	echo "Started checking $javaVmDir at $(date)"

	if [ -d "$javaVmDir" ]; then 
		tput setaf 2; echo "$javaVmDir directory exists"; tput sgr0
		
		echo "-------------"
		ls $javaVmDir
		echo "-------------"
		tput setaf 2; echo "Successfully checked $javaVmDir."; tput sgr0

		end=$(date +%s)
		echo "Finished checking $javaVmDir at $(date)"

		duration=$(( $end - $start ))
		echo "Total execution time: $duration second(s)"
		echo ""
	else 
		echo "$javaVmDir directory doesn't exist so creating it now"
		sudo mkdir -p $javaVmDir;
		
		echo "-------------"
		ls $javaVmDir
		echo "-------------"
		
		tput setaf 2; echo "Successfully created $javaVmDir."; tput sgr0

		end=$(date +%s)
		echo "Finished checking $javaVmDir at $(date)"

		duration=$(( $end - $start ))
		echo "Total execution time: $duration second(s)"
		echo ""
	fi
}

check_java_vm_directory
