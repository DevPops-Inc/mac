#!/bin/bash

# add printer function on Mac

# declare variables
echo "What is the name of the printer you wish to add?"
read PRINTERNAME # Example: "IT"
echo "What is the IP address of the printer?"
read PRINTERIPADDRESS # Example: "10.10.6.144"

# define function 
addPrinter() {
    /usr/sbin/lpadmin -p $PRINTERNAME -E -v lpd://$PRINTERIPADDRESS/$PRINTERNAME -D $PRINTERNAME -P /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Versions/A/Resources/Generic.ppd    
    lpstat -p
}

# call function
addPrinter
