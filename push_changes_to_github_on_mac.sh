#!/bin/bash

# push changes to GitHub on Mac

# initialize Git repo
git init

# list contents of repo
printf "\nFiles in repo:\n"
ls

# stage changes
printf "\nWhat file do you wish to commit?"
read CHANGE
git add $CHANGE

# commit message 
printf "\nWhat is the commit message?"
read MESSAGE
git commit -m "$MESSAGE"

# push changes 
git push
