#!/bin/bash
set -e

# #verify and repair disk on Mac function

# declare variables 
DISK="Macintosh HD"

# define function to verify and repair disk
verifyRepairDisk() {
    diskutil verifyVolume 
    diskutil repairVolume 
}

# call function
verifyRepairDisk
