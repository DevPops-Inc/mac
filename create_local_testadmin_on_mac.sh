#!/bin/bash
set -e 

# create local test admin on Mac

# prompt user input 
printf "\nCreate local test admin on Mac."
read -p "Press any key to continue or press control and C keys to quit."

# declare testAdmin, uniqueId, and password variables
localAdmin="TEST"
uniqueId="1002"
password="TEST"

# define createLocalTestAdmin function
createLocalTestAdmin() {
    # create username
    dscl . -create /Users/$localAdmin UserShell /bin/bash
    dscl . -create /Users/$localAdmin RealName $localAdmin

    # create unique ID
    dscl . -create /Users/$localAdmin uniqueId $uniqueId

    # create primary group
    dscl . -create /Users/$localAdmin PrimaryGroupID 1000

    # create home folder
    dscl . -create /Users/$localAdmin NFSHomeDirectory /Local/Users/username

    # create password
    dscl . -passwd /Users/$localAdmin $password

    # grant admin rights
    dscl . -append /Groups/admin GroupMembership $localAdmin

    # check if local admin has been created
    dscl . list /Users | grep -v '_'
}

# call createLocalTestAdmin function
createLocalTestAdmin
