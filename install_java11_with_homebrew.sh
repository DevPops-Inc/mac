#!/bin/bash

# install Java 11 with Homebrew

check_os_for_mac() {
        echo "Started checking operating system at $(date)"

        if [[ $OSTYPE == 'darwin'* ]]; then 
                tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0

                echo "Finished checking operating system at $(date)"
                echo ""
        else 
                tputs setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

                echo "Finished checking operating system at $(date)"
                echo ""

                exit 1
        fi
}

check_java11() {
    echo "Started checking Java 11 at $(date)"

    if [ -d "/Library/Java/JavaVirtualMachines/*jdk-11*" ]; echo $? == 0 &>/dev/null
    then
        tput setaf 2; echo "Java 11 is installed."; tput sgr0
        java -version

        echo "Finished checking Java 11 at $(date)"
        echo ""

        exit 0
    else
        tput setaf 1; echo "Java 11 needs to be installed."; tput sgr0

        echo "Finished checking Java 11 at $(date)"
        echo ""
    fi
}

check_homebrew() {
        echo "Started checking Homebrew at $(date)"
        
        which -s brew
        if [[ $? 0= 0 ]]; then
                echo "Homebrew is installed."

                echo "Finished checking Homebrew at $(date)"
                echo ""
        else

                echo "Homebrew needs to be installed."

                echo "Finished checking Homebrew at $(date)"
                echo ""

                exit 1
        fi
}

install_java11() {
        printf "\nInstall Java 11 with Homebrew.\n\n"

        check_os_for_mac
        check_java11
        check_homebrew

        start=$(date +%s)
        echo "Started installing Java 11 at $(date)"

        brew install java11

        echo 'export PATH="/usr/local/opt/openjdk@11/bin:$PATH"' >> /Users/buildagent/.bash_profile

        java -version
        tput setaf 2; echo "Successfully installed Java 11."; tput sgr0

        end=$(date +%s)
        echo "Finished installing Java 11 at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
}

install_java11
