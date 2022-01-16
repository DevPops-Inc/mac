#!/bin/bash 

# check ideviceinstaller on Mac

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
	fi
}

check_ideviceinstaller() {
    printf "\nCheck ideviceinstaller on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
	echo "Started checking ideviceinstaller at $(date)"

	if [ -d $(which ideviceinstaller) ]; echo $? == 0 &>/dev/null
	then 
		tput setaf 2; echo "ideviceinstaller is installed."; tput sgr0
        ideviceinstaller --version
        
        end=$(date +%s)
		echo "Finished checking ideviceinstaller at $(date)"

        duration=$(date +%s)
        echo "Total execution time: $duration second(s)"
		echo ""

		exit 0
	else 
		tput setaf 1; echo "ideviceinstaller is not installed."; tput sgr0

        end=$(date +%s)
		echo "Finished checking ideviceinstaller at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
		echo ""
	fi
}

check_ideviceinstaller
