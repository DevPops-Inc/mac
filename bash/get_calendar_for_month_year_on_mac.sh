#!/bin/bash
set -e 

# get calendar for month and year on Mac

# you can run this script with: ./get_calendar_for_month_year_on_mac.sh < month > < year > 

month=$1 # you can set the month here
year=$2 # you can set the year here

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

get_month() {
    if [ -z $month ]; then 
        read -p "Please type the month you would like and press \"return\" key (Example: November): " month

        echo ""
    else 
        echo $month $>/dev/null
    fi
}

get_year() {
    if [ -z $year ]; then 
        read -p "Please type the year you would like and press \"return\" key (Example: 1981): " year

        echo ""
    else 
        echo $year $>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameter(s) at $(date)"
    valid="true"

    echo "Parameter(s):"
    echo "-------------"
    echo "month: $month"
    echo "year : $year"
    echo "-------------"

    if [ -z $month ]; then 
        tput setaf 1; echo "month is not set."; tput sgr0
        valid="false"
    fi 

    if [ -z $year ]; then 
        tput setaf 1; echo "year is not set."; tput sgr0
        valid="false"
    fi

    if [ $valid == "true" ]; then 
        tput setaf 2; echo "All parameter check(s) passed."; tput sgr0

        echo "Finished checking parameter(s) at $(date)"
        echo ""
    else 
        tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0

        echo "Finished checking parameter(s) at $(date)"
        echo ""

        exit 1
    fi
}

get_calendar() {
    printf "\nGet calendar for month and year on Mac.\n\n"
    check_os_for_mac

    get_month
    get_year
    check_parameters

    start=$(date +%s)
    echo "Started getting calendar at $(date)"

    cal $month $year

    tput setaf 2; echo "Successfully got calendar."; tput sgr0

    end=$(date +%s)
    echo "Finished getting calendar at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

get_calendar
