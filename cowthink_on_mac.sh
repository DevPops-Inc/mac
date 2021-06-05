#!/bin/bash

# cowthink on Mac

# prompt user input
printf "\nCowthink on Mac."
read -p "Press any key to continue or press Control and C keys to quit."

# declare variables
printf "\nWhat would you like for the cow to think?"
read THOUGHT

# cowthink
cowthink $THOUGHT
