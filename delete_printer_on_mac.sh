#!/bin/bash

# delete printer

# declare variables
PRINTERNAME= # Example: "Printer1"

# delete printer
/usr/sbin/lpadmin -x $PRINTERNAME

# get printer names
lpstat -p | awk '{print $2}'
