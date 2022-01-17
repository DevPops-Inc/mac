#!/bin/bash 

check_os_for_mac() {
        echo "Started checking operating system at $(date)"

        if [[ $OSTYPE == 'darwin'* ]]; then 
                tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0

                echo "Finished checking operating system at $(date)"
                echo ""
        else 
                tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

                echo "Finisehd checking operating system at $(date)"
                echo ""
        fi
}

check_ios-deploy() {
        echo "Started checking ios-deploy at $(date)"

        if [ -d $(which ios-deploy) ]; echo $? == 0 &>/dev/null
        then 
                tput setaf 2; echo "ios-deploy is installed."; tput sgr0
                ios-deploy --version
                
                echo "Finished checking ios-deploy at $(date)"
                echo ""

                exit 0
        else 
                tput setaf 1; echo "ios-deploy is not installed."; tput sgr0

                echo "Finished checking ios-deploy at $(date)"
                echo ""
        fi
}

check_npm() {
        echo "Started checking NPM at $(date)"

        if [ -d $(which npm) ]; echo $? == 0 &>/dev/null
        then
                tput setaf 2; echo "NPM is installed"; tput sgr0
                npm --version

                echo "Finished checking NPM at $(date)"
                echo ""
        else
                tput setaf 1; echo "NPM is not installed"; tput sgr0

                echo "Finished checking NPM at $(date)"
                echo ""

                exit 1
        fi
}

install_ios-deploy() {
        printf "\nInstall ios-deploy with NPM on Mac.\n\n"

        check_os_for_mac
        check_ios-deploy
        check_npm

        start=$(date +%s)
        echo "Started installing ios-deploy at $(date)"

        npm install -g ios-deploy
        ios-deploy --version
        tput setaf 2; echo "Successfully installed ios-deploy."; tput sgr0

        end=$(date +%s)
        echo "Finished installing ios-deploy at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
}

install_ios-deploy
