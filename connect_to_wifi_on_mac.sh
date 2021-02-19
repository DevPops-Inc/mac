#!/bin/bash
set -e

# connect to Wi-Fi on Mac

#declare variables
echo "What is SSID you want to connect to?"
read SSID # Example: "YourWiFi"
echo "What is the password for the SSID?"
read PASSWORD # Example: "YourPassword"

#connect to Wi-Fi
networksetup -setairportnetwork en0 $SSID $PASSWORD
