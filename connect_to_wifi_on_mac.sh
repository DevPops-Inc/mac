#!/bin/bash
set -e

# connect to Wi-Fi on Mac

# prompt user input
printf "Connect to Wi-Fi on Mac.\n"
read -p "Press any key to continue press control and C keys to quit."
printf "\n"

# declare SSID and PASSWORD variables
printf "What is SSID you want to connect to? (Example: YourWiFi)\n"
read SSID
printf "What is the password for the SSID? (Example: YourPassword)\n"
read PASSWORD

# connect to Wi-Fi
networksetup -setairportnetwork en0 $SSID $PASSWORD
