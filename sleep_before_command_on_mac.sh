#!/bin/bash

# sleep before command on Mac

# declare variables
printf "How long do you want to wait before executive command?\nUse s for seconds, m for minutes, h for hours, and d for days.\n(Example: 3s for 3 seconds)\n"
read SLEEPTIME
echo "What command would you like to run? (Example: ps)"
read COMMAND

# sleep and execute command
printf "\nPlease wait for your command to run.\n"
sleep $SLEEPTIME
$COMMAND
