#!/bin/bash

# enable SSH on Mac

# prompt user input
printf "\nEnable SSH on Mac.\n"
read -p "Press any key to continue or press control and C keys to quit."

# define enableSshOnMac function
enableSshOnMac() {
    # check SSH status
    systemsetup -getremotelogin

    # enable SSH
    systemsetup -setremotelogin on
    systemsetup -getremotelogin
}

# call enableSshOnMac function
sudo enableSshOnMac
