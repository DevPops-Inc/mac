#!/bin/bash
set -e 

# create standard user on Mac

# you can run this script with: ./create_standarduser_on_mac.sh

standardUser=$1 # you can set standard user here
uniqueI=$2 # you can set unique ID here
password=$3 # you can set password here

check_os_for_mac() {

    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Sorry but this script only runs on Mac."; tput sgr0
        echo ""
        
        exit 1
    fi
}

get_standard_user() {
    if [ -z $standardUser ]; then 
        read -p "Please type the name of the user and press \"return\" (Example: Student): " standardUser

        echo ""
    else 
        echo $standardUser
    fi
}

get_unique_id() {
    if [ -z $uniqueId ]; then 
        read -p "Please type the unique ID and press \"return\" key (Example: 1002): " uniqueId

        echo ""
    else 
        echo $uniqueId
    fi
}

get_password() {
    if [ -z $password ]; then 
        read -s "Please type the password and press \"return\" key (Example: student)" $password

        echo ""
    else 
        echo $password
    fi
}

check_parameters() {
    echo "Started checking parameters at $(date)"
    valid="true"

    echo "Parameters:"
    echo "---------------------------"
    echo "standardUser: $standardUser"
    echo "uniqueId    : $uniqueId"
    echo "password    : ***"
    echo "---------------------------"

    if [ -z $standardUser ]; then 
        tput setaf 1; echo "standardUser is not set."; tput sgr0
        valid="false"
    fi

    if [ -z $uniqueId ]; then 
        tput setaf 1; echo "uniqueId is not set."; tput sgr0
        valid="false"
    fi

    if [ -z $password ]; then 
        tput setaf 1; echo "password is not set."; tput sgr0
        valid="false"
    fi

    echo "Finished checking parameters at $(date)"
    echo ""
}

# define main function
createStandardUser() {
    printf "\nCreate standard user on Mac.\n\n"
    check_os_for_mac

    get_standard_user
    get_unique_id
    get_password
    check_os_for_mac

    start=$(date +%s)
    echo "Started creating standard user at $(date)"

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

    tput setaf 2; echo "Successfully created standard user ."; tput sgr0

    end=$(date +%s)
    echo "Finished creating standard user at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
}

# call main function
createStandardUser
