#!/bin/bash
set -e

# merge folders on Mac

# declare variables
echo "What is the source directory? (Example: /Users/Vic/Desktop/Games)"
read SOURCE
echo "What is the destination directory? (Example: /Users/Vic/Documents/Games)"
read DESTINATION

# merge folders
ditto $SOURCE $DESTINATION -v
