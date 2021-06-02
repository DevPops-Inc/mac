#!/bin/bash
set -e

# automatically delete DS_Store files on Mac

# prompt user input 
printf "\nAutomatically delete DS_Store files on Mac."
read -p "Press any key to continue or press control and C keys to quit."

# declare hour variable 
printf "\nHow many hour intervals would you like between deletion (Example: 24)?"
read hour

# define deleteDsStoreFiles fucntion
deleteDsStoreFiles() {
    # configure cronjob
    crontab -e

    # configure time interval for automatic deletion of .DS_Store files
    * $hour * * * root find / -name ".DS_Store" -depth -exec rm {} \;
}

# call deleteDsStoreFiles function 
deleteDsStoreFiles
