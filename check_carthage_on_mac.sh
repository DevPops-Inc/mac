#!/bin/bash 

# check carthage on Mac

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

check_carthage() {
    printf "\nCheck carthage on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
	echo "Started checking carthage at $(date)"

	if [ -d $(which carthage) ]; echo $? == 0 &>/dev/null
	then 
		tput setaf 2; echo "carthage is installed."; tput sgr0

        end=$(date +%s)
		echo "Finished checking carthage at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
		echo ""

		exit 0
	else 
		tput setaf 1; echo "carthage is not installed."; tput sgr0

        end=$(date +%s)
		echo "Finished checking carthage at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
		echo ""
	fi
}

check_carthage
