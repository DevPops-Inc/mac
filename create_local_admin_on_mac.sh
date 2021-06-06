#!/bin/bash
set -e 

# create local admin on Mac

# prompt user input
printf "\nCreate local admin on Mac.\n"
read -p "Press any key to continue or press control and C keys to quit."

# declare localAdmin, uniqueId, and password variables
printf "\nWhat is the nanme of the admin? (Example: Admin)\n"
read localAdmin
printf "\nWhat is the unique ID number? (Example: 1001)\n"
read uniqueId
printf "\nWhat is the password? (Example: password123)\n"
read password

# define createLocalAdmin function 
createLocalAdmin() {
    # create username
    dscl . -create /Users/$localAdmin UserShell /bin/bash
    dscl . -create /Users/$localAdmin RealName $localAdmin

    # create unique ID
    dscl . -create /Users/$localAdmin uniqueId $uniqueId

    # create primary group
    dscl . -create /Users/$localAdmin PrimaryGroupID 1000

    # create home folder
    dscl . -create /Users/$localAdmin NFSHomeDirectory /Local/Users/$localAdmin

    # create password
    dscl . -passwd /Users/$localAdmin $password

    # grant admin rights
    dscl . -append /Groups/admin GroupMembership $localAdmin

    # check if local admin has been created
    dscl . list /Users | grep -v '_'
}

# call createLocalAdmin function
createLocalAdmin
