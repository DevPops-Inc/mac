#!/bin/bash

# add printer function on Mac

# prompt user input 
printf "Add printer on Mac.\n"
read -p "Press any key to continue or press control and C keys to quit."
printf "\n"

# declare printerName and printerIp variable
printerName = read -p 'Please type the printer name: (Example: IT)'
printerIp = read -p 'Please type the IP address of the printer: (Example: 10.10.6.144)'

# define addPrinter function 
addPrinter() {
    # add printer
    /usr/sbin/lpadmin -p $printerName -E -v lpd://$printerIp/$printerName -D $printerName -P /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Versions/A/Resources/Generic.ppd 

    # list printers   
    lpstat -p
}

# call addPrinter function
addPrinter
