#!/bin/python

# check ideviceinstaller on Mac

import colorama, os, sys, subprocess, traceback
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


def checkIDeviceInstaller(): 
    print("\nCheck ideviceinstaller on Mac.\n")
    checkOsForMac()

    try:
        startDateTime = datetime.now()
        print("Started checking ideviceinstaller at", startDateTime.strftime("%m-%d-%Y %I:%M %p"))

        FNULL = open(os.devnull, 'w')
        checkAnsibleOnMacOrLinux = subprocess.call(['which', 'ideviceinstaller'], stdout=FNULL) 

        if checkAnsibleOnMacOrLinux == 0:
            print(Fore.GREEN + "ideviceinstaller is installed."+ Style.RESET_ALL)
            os.system('ideviceinstaller --version')
            print(Fore.GREEN + "Successfully checked ideviceinstaller." + Style.RESET_ALL)

            finishedDateTime = datetime.now()
            print("Finished checking Hombrew at", finishedDateTime.strftime("%m-%d-%Y %I:%M %p"))

            duration = finishedDateTime - startDateTime
            print("Total execution time: {0} second(s)".format(duration.seconds))
            print("")

        else: 
            raise Exception("ideviceinstaller is not installed.")

        
    except Exception: 
        print(Fore.RED + "Failed to check ideviceinstaller.")
        traceback.print_exc()
        exit("" + Style.RESET_ALL)
        

checkIDeviceInstaller()
