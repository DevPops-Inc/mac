#!/bin/python 

# allow apps downloaded from anywhere on Mac

import colorama, os, sys, time, traceback
from colorama import Fore, Style 
from datetime import datetime
colorama.init()


def checkOsForMac(): 
    print("Started checking operating system at", datetime.now().strftime("%m-%d-%Y %I:%M %p"))

    if sys.platform == "darwin":
        print(Fore.GREEN + "Operating System: ")
        os.system('sw_vers')
        print(Style.RESET_ALL, end="") 
        
        print("Finished checking operating system at", datetime.now().strftime("%m-%d-%Y %I:%M %p"))

        print("")
    else:
        raise Exception("Sorry but this script only runs on Mac.")


def allowAppsDownloadedFromAnywhere():
    print("\nAllow apps downloaded from anywhere on Mac.\n")
    checkOsForMac()

    try:
        startDateTime = datetime.now()
        
        print("Started allowing apps downloaded from anywhere at", startDateTime.strftime("%m-%d-%Y %I:%M %p")) 
        
        os.system('sudo spctl --master-disable')
        
        # TODO: test if this command replaces the manual steps below: os.system('sudo defaults write /Library/Preferences/com.apple.security GKAutoRearm -bool NO')

        print("\nExpand Apple menu and select \"System Preferences...\"")
        input("Press any key to continue: ")
        print("")

        print("Select \"Security & Privacy.\"")
        input("Press any key to continue: ")
        print("")
        
        print("Select \"General\" tab and you will see \"Anywhere\" option under \"Allow apps downloaded from:\" list now.")
        input("Press any key to continue: ")
        print("")

        print("Select the lock icon and log in with your credentials.")
        input("Press any key to continue: ")
        print("")

        print("Select \"Anywhere\" to allow apps to be downloaded from anywhere on your Mac.")
        input("Press any key to continue: ")
        print("")

        print(Fore.GREEN + "Successfully allowed apps downloaded from anywhere." + Style.RESET_ALL)

        finishedDateTime = datetime.now()
        
        print("Finished allowing apps downloaded from anywhere at", finishedDateTime.strftime("%m-%d-%Y %I:%M %p"))

        duration = finishedDateTime - startDateTime
        print("Total execution time: {0} second(s)".format(duration.seconds))
        print("")

    except Exception: 
        print(Fore.RED + "Failed to allow apps downloaded from anywhere.")
        print(traceback.print_stack())
        exit("" + Style.RESET_ALL)


allowAppsDownloadedFromAnywhere()
