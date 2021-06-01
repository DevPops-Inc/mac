#!/bin/bash

# allow apps downloaded from anywhere on Mac

# prompt user input 
printf "\nAllow apps to be downloded from anywhere on Mac."
read -p "Press any key to continue or press control and C keys to quit."

# allow apps downloaded from anywhere on Mac
sudo spctl --master-disbable 

# prompt user where to look 
printf "\nYou will see \"Anywhere\" option under \"Allow apps downloaded from:\" list in Security & Privacy now."
