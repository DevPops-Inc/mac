#!/bin/bash
set -e

# delete all DS_Store files from Mac

# prompt user input
printf "\nDelete all DS_Store files from Mac."
read -p "Press any key to continue or press Control and C keys to quit."

# delete all DS_Store files
find / -name “.DS_Store” -depth -exec rm {} \;
