#!/bin/bash
set -e

# eject disc drive on Mac

# prompt user input
printf "\nEject disc drive on Mac.\n"
read -p "Press any key to continue or press control and C keys to quit."

# eject disc drive 
drutil tray eject
