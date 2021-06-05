#!/bin/bash

# prompt user input 
printf "\nHave the cow think your fortune.\n"
read -p "Press any key to continue or press control and C keys to quit."

# define cowthinkFortune function
cowthinkFortune() {
    # cowthink fortune
    printf "\n"
    fortune | cowthink
    printf "\n"
}

# call cowthinkFortune function 
cowthinkFortune
