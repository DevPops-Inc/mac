#!/bin/bash
set -e

# connect to Wi-Fi on Mac

# prompt user input
printf "\nConnect to Wi-Fi on Mac.\n"
read -p "Press any key to continue press control and C keys to quit."

# declare SSID and PASSWORD variables
printf "\nWhat is SSID you want to connect to? (Example: YourWiFi)"
read ssid
printf "\nWhat is the password for the SSID? (Example: YourPassword)"
read password

# connect to Wi-Fi
networksetup -setairportnetwork en0 $ssid $password
