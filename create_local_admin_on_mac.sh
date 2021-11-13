#!/bin/bash
set -e 

# create local admin on Mac

# you can run script with: ./create_local_admin_on_mac.sh < local admin > < unique ID > < password > 

localAdmin=$1 # you can set local admin here
uniqueIdp=$2 # you can set unique ID here
password=$3 # you can set password here 

check_os_for_mac() {

    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then
        tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

get_local_admin() {
    if [ -z $localAdmin ]; then 
        read -p "Please type the local admin name and press \"return\" key (Example: Admin): " localAdmin

        echo ""
    else 
        echo $localAdmin
    fi
}

get_unique_id() {
    if [ -z $uniqueId ]; then 
        read -p "Please type the unique ID and press \"return\" key (Example: 1001): " uniqueId

        echo ""
    else 
        echo $uniqueId
    fi
}

get_password() {
    if [ -z $password ]; then 
        read -s "Please type the password and press \"return\" key (Example: password123): "

        echo ""
    else 
        echo $password
    fi
}

check_parameters() {
    echo "Started checking parameters at $(date)"
    valid="true"

    echo "Parameters:"
    echo "-----------------------"
    echo "localAdmin: $localAdmin"
    echo "uniqueId: $uniqueId"
    echo "password: ***"
    echo "-----------------------"

    if [ -z $localAdmin ]; then
        tput setaf 1; echo "localAdmin is not set."; tput sgr0
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

    if [ $valid == "true" ]; then 
        tput setaf 2; echo "All parameter checks passed."; tput sgr0
    else 
        tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0
        exit 1
    fi

    echo "Finished checking parameters at $(date)"
    echo ""
}

# define main function 
create_local_admin() {
    printf "\nCreate local admin on Mac.\n\n"
    check_os_for_mac

    get_local_admin
    get_unique_id
    get_password
    check_parameters

    start=$(date +%s)
    echo "Started creating local admin at $(date)"

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

    end=$(date +%s)
    echo "Finished checking local admin at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
}

# call main function
create_local_admin
