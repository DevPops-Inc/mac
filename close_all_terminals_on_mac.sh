#!/bin/bash

# close all Terminals on Mac

# prompt user input
printf "\nClose all Terminals on Mac.\n"
read -p "Press any key any key to continue or press control and C keys to quit."

# close terminals
ps x | grep Terminal.app | grep -v grep | awk '{ system("kill -9 " $1) }'
