#!/bin/bash
set -e 

# create local admin on Mac

#declare variables
LOCALADMIN= # Example: 'Admin'
UNIQUEID= # Example: '1001'
PASSWORD= # Example: 'Password123'

#create username
dscl . -create /Users/$LOCALADMIN UserShell /bin/bash
dscl . -create /Users/$LOCALADMIN RealName $LOCALADMIN

#create unique ID
dscl . -create /Users/$LOCALADMIN UniqueID $UNIQUEID

#create primary group
dscl . -create /Users/$LOCALADMIN PrimaryGroupID 1000

#create home folder
dscl . -create /Users/$LOCALADMIN NFSHomeDirectory /Local/Users/$LOCALADMIN

#create password
dscl . -passwd /Users/$LOCALADMIN $PASSWORD

#grant admin rights
dscl . -append /Groups/admin GroupMembership $LOCALADMIN

#check if local admin has been created
dscl . list /Users | grep -v '_'
