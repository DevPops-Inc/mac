#!/bin/bash

# resolve Docker failed to ping backend API error on Mac

# prompt user input
printf "\nResolve Docker failed to ping backend API error on Mac.\n"
read -p "Press any key to continue or press control and C keys to quit."

getDockerProcessId() {
    printf "\nPlease press control and C keys to stop process after you find Docker's process ID.\n\n"
    top | grep "Docker"
}

stopAndRestartDocker() {
    printf "\nPlease type the process ID for Docker (Example: 599): \n"
    read processId
    kill $processId
    open -a Docker.app
}

resolveDockerFailedPingBackendApiError() {
    getDockerProcessId
    stopAndRestartDocker
}

resolveDockerFailedPingBackendApiError
