#!/bin/bash

# install JDK with homebrew

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

check_jdk() {
        echo "Started checking JDK at $(date)"

        if [ -d "/Library/Java/JavaVirtualMachines/*jdk*" ]; echo $? == 0 &>/dev/null
        then
                tput setaf 2; echo "JDK is installed."; tput sgr0
                java -version

                echo "Finished checking JDK at $(date)"
                echo ""

                exit 0
        else 
                tput setaf 1; echo "JDK is not installed."; tput sgr0

                echo "Finished checking JDK at $(date)"
                echo ""
        fi
}

check_homebrew() {
        echo "Started checking Homebrew at $(date)"

        which -s brew
        if [[ $? != 0 ]]; then
                tput setaf 1; echo "Homebrew needs to be installed."; tput sgr0

                echo "Finished checking Homebrew at $(date)"
                echo ""

                exit 1
        else
                tput setaf 2; echo "Homebrew is installed."; tput sgr0

                echo "Finished checking Homebrew at $(date)"
                echo ""
        fi
}

install_jdk() {
        printf "\nInstall JDK with Homebrew.\n\n"

        check_os_for_mac
        check_jdk
        check_homebrew

        start=$(date +%s)
        echo "Started installing JDK at $(date)"

        brew install java

        sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk \
        /Library/Java/JavaVirtualMachines/openjdk.jdk

        java -version
        tput setaf 2; echo "Successfully installed JDK."; tput sgr0

        end=$(date +%s)
        echo "Finished installing JDK at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
}

install_jdk
