#!/bin/bash 

# stop and restart Outlook function on Mac

# declare variables
PROCESSNAME="Microsoft Outlook"
SLEEPTIME=5
APPLICATIONNAME="Microsoft Outlook.app"

# define function
stopRelaunchOutlook() {
    pkill $PROCESSNAME
    sleep $SLEEPTIME
    open -a "${APPLICATIONNAME}"
}

# call function
stopRelaunchOutlook
