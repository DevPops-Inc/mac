#!/bin/bash 

# stop and restart Outlook on Mac

processName="Microsoft Outlook"
sleepTime=5
appName="Microsoft Outlook.app"

check_os_for_mac() {
	echo "Started checking operating system at $(date)"
	
	if [[ $OSTYPE == 'darwin'* ]]; then 
		tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0
		
		echo "Finished checking operting at $(date)"
		echo ""
	else 
		tput setaf 1; echo "Sorry but this script only only runs on Mac."; tput sgr0
		
		echo "Finished checking operating at $(date)"
		echo ""
		
		exit 1
	fi
}

get_process_name() {
	if [ -z "$processName" ]; then 
		read -p "Please type the name of the process you would like to kill and press \"return\" (Example: Microsoft Outlook): " processName
	
		echo ""
	else 
		echo "$processName"
	fi
}

get_sleep_time() {
	if [ -z $sleepTime ]; then 
		read -p "Please type how many seconds you would like to wait before restarting the process and press \"return\" (Example: 5)" sleepTime
		
		echo ""
	else 
		echo $sleepTime
	fi
}

get_app_name() {
	if [ -z "$appName" ]; then 
		read -p "Please type the application you wish you to start up and press \"return\" key (Example: Microsoft Outlook.app): " appName
		
		echo ""
	else 
		echo "$appName"
	fi
}

check_parameters() {
	echo "Started checking parameters at $(date)"
	valid="true"
	
	echo "Parameters:"
	echo "-------------------------"
	echo "processName: $processName"
	echo "sleepTime  : $sleepTime"
	echo "appName    : $appName"
	echo "-------------------------"
	
	if [ -z "$processName" ]; then 
		tput setaf 1; echo "processName is not set."; tput sgr0
		valid="false"
	fi
	
	if [ -z $sleepTime ]; then 
		tput setaf 1; echo "sleepTime is not set."; tput sgr0
		valid="false"
	fi
	
	if [ -z "$appName" ]; then
		tput setaf 1; echo "appName is not set."; tput sgr0
		valid="false"
	fi
	
	echo "Finished checking parameters at $(date)"
	echo ""
}

stop_relaunch_outlook() {
	printf "\nStop and relaunch Outlook on Mac.\n\n"
	check_os_for_mac
	
	get_process_name
	get_sleep_time
	get_app_name
	check_parameters

	start=$(date +%s)
	echo "Started stopping and relaunching Outlook at $(date)"
	
  	pkill $processName
  	sleep $sleepTime
	open -a "${appName}"

	end=$(date +%s)
	echo "Finished stopping and relaunching Outlook at $(date)"
	
	duration=$(( $end - $start ))
	echo "Total execution time: $duration second(s)"
	echo ""
}

stop_relaunch_outlook
