#!/bin/bash
set -e 

# check Kubernetes on Mac

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
    fi
}

check_minikube() {
    echo "Started checking minikube at $(date)"

    if which -s minikube; then 
        tput setaf 2; echo "minikube is installed."; tput sgr0
        minikube update-check

        echo "Finished checking minikube at $(date)"
        echo ""

        exit 0
    else 
        tput setaf 1; echo "minikube is not installed."; tput sgr0
        
        echo "Finished checking minikube at $(date)"
        echo ""
    fi
}

check_kubectl() {
    echo "Started checking kubectl at $(date)"

    if which -s kubectl; then 
        tput setaf 2; echo "kubectl is installed."; tput sgr0
        kubectl version --client 

        echo "Finished checking kubctl at $(date)"
        echo ""

        exit 0
    else 
        tput setaf 1; echo "kubectl is not installed."; tput sgr0
        
        echo "Finished checking kubectl at $(date)"
        echo ""
    fi
}

check_kubernetes() {
    printf "\nCheck Kubernetes on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started checking Kubernetes at $(date)"

    check_minikube
    check_kubectl
    tput setaf 2; echo "Successfully checked Kubernetes at $(date)"; tput sgr0

    end=$(date +%s)
    echo "Finished checking Kubernetes at $(date)"
    
    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

check_kubernetes
