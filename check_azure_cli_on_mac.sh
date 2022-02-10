#!/bin/bash

# check Azure CLI on Mac

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

check_azure_cli() {
    printf "\nCheck Azure CLI on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
	echo "Started checking Azure CLI at $(date)"

	which -s az
	if [[ $? != 0 ]]; then 
		tput setaf 1; echo "Azure CLI is not installed."; tput sgr0

        end=$(date +%s)
		echo "Finished checking Azure CLI at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
		echo ""

        exit 1
	else 
		tput setaf 2; echo "Azure CLI is installed."; tput sgr0
		az --version

        end=$(date +%s)
		echo "Finished checking Azure at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
		echo ""
	fi
}

check_azure_cli
