#!/bin/bash
set -e

# install macOS updates

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating System:\n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

install_software_updates() {
    printf "\nInstall macOS updates.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started installing macOS updates at $(date)"

    softwareupdate --install --all
    tput setaf 2; echo "Successfully installed macOS updates."; tput sgr0

    end=$(date +%s)
    echo "Finished isntalling macOS updates at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

install_software_updates
