#!/bin/bash
set -e 

#declare variables
echo "What is the name of the user? (Example: 'Student')"
read STANDARDUSER
echo "What is the unique ID number? (Example: '1002')"
read UNIQUEID
echo "What is the password? (Example: 'student')"
read PASSWORD

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
