#!/bin/python

# check deviceconsole on Mac

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


def checkDeviceConsole(): 
    print("\nCheck deviceconsole on Mac.\n")
    checkOsForMac()

    try:
        startDateTime = datetime.now()
        print("Started checking deviceconsole at", startDateTime.strftime("%m-%d-%Y %I:%M %p"))

        FNULL = open(os.devnull,  'w')
        checkAnsibleOnMacOrLinux = subprocess.call(['which', 'brew'], stdout=FNULL) 

        if checkAnsibleOnMacOrLinux == 0:
            print(Fore.GREEN + "deviceconsole is installed."+ Style.RESET_ALL)
            os.system('brew --version')
            print(Fore.GREEN + "Successfully checked deviceconsole." + Style.RESET_ALL)

            finishedDateTime = datetime.now()

            print("Finished checking Hombrew at", finishedDateTime.strftime("%m-%d-%Y %I:%M %p"))

            duration = finishedDateTime - startDateTime
            print("Total execution time: {0} second(s)".format(duration.seconds))
            print("")

        else: 
            print(Fore.RED + "deviceconsole is not installed." + Style.RESET_ALL)
            
            finishedDateTime = datetime.now()

            print("Finished checking deviceconsole at", finishedDateTime.strftime("%m-%d-%Y %I:%M %p"))

            duration = finishedDateTime - startDateTime
            print("Total execution time: {0} second(s)".format(duration.seconds))
            exit("")
        
    except Exception: 
        print(Fore.RED + "Failed to check deviceconsole.")
        traceback.print_exc()
        exit("" + Style.RESET_ALL)


checkDeviceConsole()
