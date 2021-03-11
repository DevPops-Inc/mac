#!/bin/bash
set -e

# connect to Wi-Fi on Mac

#declare variables
echo "What is SSID you want to connect to? (Example: YourWiFi)"
read SSID
echo "What is the password for the SSID? (Example: YourPassword)"
read PASSWORD

#connect to Wi-Fi
networksetup -setairportnetwork en0 $SSID $PASSWORD
