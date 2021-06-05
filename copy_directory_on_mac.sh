#!/bin/bash
set -e

# copy directory on Mac

# prompt user input
printf "\nCopy directory on Mac."
read -p "Press any key to continue or press control and C keys to quit."

# declare source and destination variables
printf "\nWhat is the source directory you wish to copy? (Example: /Documents)"
read source
printf "\nWhat is the destination directory you wish to copy to? (Example: /Desktop)"
read destination

# define copyDirectory function 
copyDirectory() {
    # copy directory
    cp -R $source /$destination

    # list contents of destination directory
    ls $destination
}

# call copyDirectory function
copyDirectory
