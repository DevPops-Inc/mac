#!/bin/bash
set -e

# verify and repair HDD on Mac function

# you can run this script with: .\verify_and_repair_hdd_on_mac.sh < HDD > 

hdd=$1 # use "MacOS" for macOS or "Macintosh HD" for older versions of Mac OSX

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

get_hdd() {
	if [ -z $hdd ]; then 
		hdd=$(ls /Volumes)
	fi
}

check_parameters() {
	echo "Started checking parameters at $(date)"
	valid="true"
	
	echo "Parameters:"
	echo "-----------"
	echo "hdd: $hdd"
	echo "-----------"
	
	if [ -z $hdd ]; then 
		tput setaf 1; echo "HDD is not set."; tput sgr0
		valid="false"
	fi
	
	if [ $valid == "true" ]; then
		tput setaf 2; echo "All parameter checks passed."; tput sgr0

		echo "Finished checking parameters at $(date)"
		echo ""
	else 
		tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0

		echo "Finished checking parameters at $(date)"
		echo ""

		exit 1
	fi
}

verify_repair_hdd() {
	printf "\nVerify and repair HDD on Mac.\n\n"
	check_os_for_mac
	
	get_hdd
	check_parameters
	
	start=$(date +%s)
	echo "Started verifying and repairing $hdd at $(date)"
	
	diskutil verifyVolume $hdd
	if [[ $? == 0 ]]; then 
		tput setaf 4; echo "Verified $hdd does not require repair."; tput sgr0
	else 
		diskutil verifyDisk $hdd
		diskutil repairVolume $hdd
		diskutil repairDisk $hdd
	fi
	
	tput setaf 2; echo "Successfully verified and repaired $hdd."; tput sgr0
	
	end=$(date +%s)
	echo "Finished verifying and repairing $hdd at $(date)"
	
	duration=$(( $end - $start ))
	echo "Total execution time: $duration second(s)"
	echo ""
}

verify_repair_hdd
