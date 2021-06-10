#!/bin/bash

# download YouTube video to desktop on Mac

# prompt user input
printf "\nDownload YouTube video to Desktop on Mac\nYou need youtube-dl installed for this script to work.\n"
read -p "Press any key to continue or press control and C keys to quit."

# declare youTubeyouTubeUrl variable
printf "\nCopy the URL of the YouTube video you want and paste it here: \n"
read youTubeUrl

# download video from YouTube
cd ~/Desktop && youtube-dl $youTubeUrl
