#!/bin/bash
set -e

# automatically delete DS_Store files function on Mac

# declare variables 
MINUTES= # you can set this 0 if you don't want minute intervals
HOUR= # you can set this to 24 if you want to cronjob to run daily

# define function
autoDeleteDsStore() { 
    crontab -e
    $MINUTES $HOUR * * * root find / -name ".DS_Store" -depth -exec rm {} \;
}

# call function
autoDeleteDsStore
