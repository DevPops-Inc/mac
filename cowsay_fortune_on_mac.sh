#!/bin/bash

# prompt user input 
printf "\nHave the cow say your fortune.\n"
read -p "Press any key to continue or press control and C keys to quit."

# define cowsayFortune function
cowsayFortune() {
    # cowsay fortune
    printf "\n"
    fortune | cowsay
    printf "\n"
}

# call cowsayFortune function 
cowsayFortune
