#!/bin/bash
set -e

# convert .cdr to .iso on Mac

# prompt user input 
printf "\nConvert .cdr to .iso on Mac."
read -p "Press any key to continue or press control and C keys to quit."

# declare variables
printf "\nPlease type filename you wish to convert to .iso (Example: test): "
read filename

#convert .cdr to .iso
hdiutil makehybrid -iso -joliet -o $filename.iso $filename.cdr
