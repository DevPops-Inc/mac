#!/bin/bash
set -e

# disconnect from Wi-Fi on Mac

# prompt user input 
printf "\nDisconnect from Wi-Fi on Mac."
read -p "Press any key to continue or press control and C keys to quit."

# declare ssid variable
printf "\nwPlease type ssid you wish to disconnect from (Example: IT-Network): "
read ssid

# define removeWiFiNetwork function
removeWiFiNetwork() {
    # remove Wi-Fi network
    networksetup -removepreferredwirelessnetwork en0 $ssid
    printf "\nYou are now disconnected from $ssid network.\n"
}

# call removeWiFiNetwork function
removeWiFiNetwork
