#!/bin/bash
set -e 

# check Java 11 on Mac

java11Dir="/Library/Java/JavaVirtualMachines/*jdk-11*"

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else
        tput setaf 1; echo "Sorry but this script only runs on Mac."

        echo "Finished checking operating system at $(date)"
        echo ""
    fi
}

get_java_11_dir() {
	if [ -z "$java11Dir" ]; then 
		read -p "Please type the Java virtual machines directory and press \"return\" key (Example: /Library/Java/JavaVirtualMachines): " java11Dir

		echo ""
	else 
		echo $java11Dir &>/dev/null
	fi
}

check_parameters() {
	echo "Started checking parameter(s) at $(date)"
	valid="true"

	echo "Parameter(s):"
	echo "---------------------"
	echo "java11Dir: $java11Dir"
	echo "---------------------"

	if [ -z "$java11Dir" ]; then 
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

check_java11() {
    printf "\nCheck Java 11 on Mac."
    check_os_for_mac

    get_java_11_dir
    check_parameters

    start=$(date +%s)
    echo "Started checking Java 11 at $(date)"

    if [ -d "$java11Dir" ]; echo $? == 0 &>/dev/null
    then
        tput setaf 2; echo "Java 11 is installed."; tput sgr0
        java -version

        end=$(date +%s)
        echo "Finished checking Java 11 at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""

        exit 0
    else
        tput setaf 1; echo "Java 11 needs to be installed."; tput sgr0

        end=$(date +%s)
        echo "Finished checking Java 11 at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
    fi
}

check_java11
