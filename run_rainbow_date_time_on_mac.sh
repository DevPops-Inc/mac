#!/bin/bash

# run rainbow date and time
while true; do echo "$(date '+%D %T' | toilet -f term -F border --gay)"; sleep 1; done