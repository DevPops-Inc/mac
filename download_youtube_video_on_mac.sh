#!/bin/bash

# download YouTube video to desktop on Mac

# you can run this script with: ./download_youtube_video_on_mac.sh

youTubeUrl=$1 # you can set the YouTube URL here

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
    fi 
}

check_youtube-dl() {
    echo "Started checking youtube-dl at $(date)"

    if [ -d $(which youtube-dl) ]; echo $? == 0 &>/dev/null
    then 
        tput setaf 2; echo "youtube-dl is installed."; tput sgr0

        echo "Finished checking youtube-dl at $(date)"
        echo ""
    else 
        tput setaf 1; echo "youtube-dl is not installed."; tput sgr0

        echo "Finished checking youtube-dl at $(date)"
        echo ""

        exit 1
    fi
}

get_youtube_url() {
    if [ -z $youTubeUrl ]; then 
        read -p "Please copy and paste the YouTube URL here then press \"return\" key: " youTubeUrl

        echo ""
    else 
        echo $youTubeUrl
    fi
}

check_parameters() {
    echo "Started checking parameters at $(date)"
    valid="true"

    echo "Parameters:"
    echo "-----------------------"
    echo "youTubeUrl: $youTubeUrl"
    echo "-----------------------"

    if [ -z $youTubeUrl ]; then 
        tput setaf 1; echo "youTubeUrl is not set."; tput sgr0
        valid="false"
    fi

    echo "Finished checking parameters at $(date)"
    echo ""
}

download_youtube_video() {
    printf "\nDownload YouTube video to Desktop on Mac.\n\n"

    check_os_for_mac
    check_youtube-dl

    get_youtube_url
    check_parameters

    start=$(date +%s)
    echo "Started downloading YouTube video at $(date)"

    cd ~/Desktop && youtube-dl $youTubeUrl

    tput setaf 2; echo "Successfully downloaded YouTube video to desktop."; tput sgr0

    end=$(date +%s)
    echo "Finished downloading YouTube video at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

download_youtube_video
