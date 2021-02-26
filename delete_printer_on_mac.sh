#!/bin/bash

# delete printer

# declare variables
echo "What is name of printer you wish to delete (Example: Printer1)?"
rad PRINTERNAME

# delete printer
/usr/sbin/lpadmin -x $PRINTERNAME

# get printer names
lpstat -p | awk '{print $2}'
