#!/bin/bash

# add printer function on Mac

# prompt user input 
printf "Add printer on Mac.\n"
read -p "Press any key to continue or press control and C keys to quit."
printf "\n"

# declare variables
PRINTERNAME= read -p 'Please type the printer name: (Example: IT)'
PRINTERIPADDRESS= read -p 'Please type the IP address of the printer: (Example: 10.10.6.144)'

# define function 
addPrinter() {
    /usr/sbin/lpadmin -p $PRINTERNAME -E -v lpd://$PRINTERIPADDRESS/$PRINTERNAME -D $PRINTERNAME -P /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Versions/A/Resources/Generic.ppd    
    lpstat -p
}

# call function
addPrinter
