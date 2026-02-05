#!/bin/bash
set -e 

# check JDK on Mac

jdkDir="/Library/Java/JavaVirtualMachines/*jdk*"

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

get_jdk_dir() {
	if [ -z "$jdkDir" ]; then 
		read -p "Please type the Java virtual machines directory and press \"return\" key (Example: /Library/Java/JavaVirtualMachines): " jdkDir

		echo ""
	else 
		echo $jdkDir &>/dev/null
	fi
}

check_parameters() {
	echo "Started checking parameter(s) at $(date)"
	valid="true"

	echo "Parameter(s):"
	echo "---------------"
	echo "jdkDir: $jdkDir"
	echo "---------------"

	if [ -z "$jdkDir" ]; then 
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

check_jdk() {
    printf "\nCheck JDK on Mac.\n\n"
    check_os_for_mac

    get_jdk_dir
    check_parameters

    start=$(date +%s)
    echo "Started checking JDK at $(date)"

    if [ -d "$jdkDir" ]; echo $? == 0 &>/dev/null
    then
            tput setaf 2; echo "JDK is installed."; tput sgr0
            java -version

            end=$(date +%s)
            echo "Finished checking JDK at $(date)"

            duration=$(( $end - $start ))
            echo "Total execution time: $duration second(s)"
            echo ""

            exit 0
    else 
            tput setaf 1; echo "JDK is not installed."; tput sgr0

            end=$(date +%s)
            echo "Finished checking JDK at $(date)"

            duration=$(( $end - $start ))
            echo "Total execution time: $duration second(s)"
            echo ""
    fi
}

check_jdk
