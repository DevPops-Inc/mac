#!/bin/bash

# delete printer on Mac

# prompt user input 
printf "\nDelete printer on Mac."
read -p "Press any key to continue or press Control and C keys to quit."

# declare variables
printf "\nWhat is name of printer you wish to delete (Example: Printer1)?\n"
read printerName

# define deletePrinter function
deletePrinter() {
    # delete printer
    /usr/sbin/lpadmin -x $printerName

    # get printer names
    lpstat -p | awk '{print $2}'
}

# call deletePrinter function
deletePrinter
