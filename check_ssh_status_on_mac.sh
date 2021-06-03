#!/bin/bash
set -e

# check SSH status on Mac

# prompt user input
printf "\nCheck SSH status on Mac.\n"
read -p "Press any key to continue or press Control and C keys to quit."

# check SSH status
sudo systemsetup -getremotelogin
