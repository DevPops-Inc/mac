#!/bin/bash
set -e 

# get calendar for month and year on Mac

# declare variables for month and year
echo "What month would you like? (Example: November)"
read MONTH
echo "What year would you like? (Example: 1981)"
read YEAR

# get calendar for specific month and year
cal $MONTH $YEAR
