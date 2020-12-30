#!/bin/bash
set -e

# Mac maintenance function 

# define function
macMaintenance() {
    sudo mdutil -i on /
    softwareupdate --install --all
    diskutil verifyVolume "Macintosh HD"
    diskutil repairVolume "Macintosh HD"
    echo "Save your documents and close applications."
    read -p "Press any key to restart Mac."
    shutdown -r now
}

# call function
macMaintenance
