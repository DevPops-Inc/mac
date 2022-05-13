#!/bin/bash

# install Homebrew on Mac

check_os_for_mac() {
        echo "Started checking operating system at $(date)"

        if [[ $OSTYPE == 'darwin'* ]]; then 
                tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0

                echo "Finished checking operating system at $(date)"
                echo ""
        else
                tput setaf 1; echo "Sorry but this script only works on Mac."; tput sgr0

                echo "Finished checking operating system at $(date)"
                echo ""
                
                exit 1
        fi
}

check_homebrew() {
        echo "Started checking Homebrew at $(date)"

        which -s brew
        if [[ $? == 0 ]]; then
                tput setaf 2; echo "Homebrew is installed."; tput sgr0
                brew --version

                echo "Finished checking Homebrew at $(date)"
                echo ""

                exit 0
        else

                tput setaf 1; echo "Homebrew needs to be installed."; tput sgr0

                echo "Finished checking Homebrew at $(date)"
                echo ""
        fi
}

install_homebrew() {
        printf "\nInstall Homebrew on Mac.\n\n"

        check_os_for_mac
        check_homebrew

        start=$(date +%s)
        echo "Started installing Homebrew at $(date)"

        mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

        echo -ne '\n' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        brew --version
        tput setaf 2; echo "Successfully installed Homebrew."; tput sgr0

        end=$(date +%s)
        echo "Finished installing Homebrew at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
}

install_homebrew
