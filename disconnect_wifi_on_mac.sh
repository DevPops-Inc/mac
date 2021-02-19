#!/bin/bash
set -e

# disconnect from Wi-Fi on Mac

#declare variables
echo "Which SSID do you want to disconnect from?"
read SSID

#remove Wi-Fi network
networksetup -removepreferredwirelessnetwork en0 $SSID
