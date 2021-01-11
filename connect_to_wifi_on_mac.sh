#!/bin/bash
set -e

# connect to Wi-Fi on Mac

#declare variables
SSID= # Example: "YourWiFi"
PASSWORD= # Example: "YourPassword"

#connect to Wi-Fi
networksetup -setairportnetwork en0 $SSID $PASSWORD
