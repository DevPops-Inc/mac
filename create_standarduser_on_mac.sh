#!/bin/bash
set -e 

#declare variables
STANDARDUSER= # Example: 'Student'
UNIQUEID= # Example: '1002'
PASSWORD= # Example: 'student'

#create username
dscl . -create /Users/$STANDARDUSER UserShell /bin/bash
dscl . -create /Users/$STANDARDUSER RealName $STANDARDUSER

#create unique ID
dscl . -create /Users/$STANDARDUSER UniqueID $UNIQUEID

#create primary groun
dscl . -create /Users/$STANDARDUSER PrimaryGroupID 1000

#create home folder
dscl . -create /Users/$STANDARDUSER NFSHomeDirectory /Local/Users/$STANDARDUSER

#create password
dscl . -passwd /Users/$STANDARDUSER $PASSWORD

#check if standard user has been created
dscl . list /Users | grep -v '_'
