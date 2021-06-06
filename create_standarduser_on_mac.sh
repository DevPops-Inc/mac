#!/bin/bash
set -e 

# create standard user on Mac

# prompt user input
printf "\nCreate standard user on Mac.\n"
read -p "Press any key to contiue or press control and C keys to quit."

# declare standardUser, uniqueId, and password  variables
printf "\nWhat is the name of the user? (Example: Student)\n"
read standardUser

printf "\nWhat is the unique ID number? (Example: 1002)\n"
read uniqueId

printf "\nWhat is the password? (Example: student)\n"
read password

# define createStandardUser function
createStandardUser() {
    # create username
    dscl . -create /Users/$standardUser UserShell /bin/bash
    dscl . -create /Users/$standardUser RealName $standardUser

    # create unique ID
    dscl . -create /Users/$standardUser uniqueId $uniqueId

    # create primary groun
    dscl . -create /Users/$standardUser PrimaryGroupID 1000

    # create home folder
    dscl . -create /Users/$standardUser NFSHomeDirectory /Local/Users/$standardUser

    # create password
    dscl . -passwd /Users/$standardUser $password

    # check if standard user has been created
    dscl . list /Users | grep -v '_'
}

# call createStandardUser function
createStandardUser
