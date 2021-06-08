#!/bin/bash

# disable apps downloaded from anywhere on Mac

# prompt user input
printf "\nDisable apps download from anywhere on Mac.\n"
read -p "Press any key to continue or press control and C keys to quit."

# disable apps downloaded from anywhere
sudo spctl --master-enable 

# prompt user where to look
printf "\nYou won't see \"Anywhere\" option under \"Allow apps downloaded from:\" list in Security & Privacy anywmore."
