#!/bin/bash

# install Kubernetes on Mac

# run this script in Root user or with "sudo" command

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

    which -s minikube
    if [[ $? == 0 ]]; then 
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

    which -s kubectl
    if [[ $? == 0 ]]; then 
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

install_minikube() {
    echo "Started installing minikube at $(date)"

    curl -Lo minikube https://storage.googleapis.com/minikube/release/latest/minikube-darwin/amd64 && chmod +x minikube 

    mv minikube /usr/local/bin 
    minikube update-check 

    echo "Finished installing minikube at $(date)"
    echo ""
}

install_kubectl() {
    echo "Started installing kubectl at $(date)"

    curl -Lo “https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/stable.txt)/bin/darwin/amd64/kubectl” 

    chmod +x ./kubectl 
    mv ./kubectl /usr/local/bin/kubectl 
    kubectl version --client 

    echo "Finished installing kubectl at $(date)"
    echo ""
}

install_kubernetes() {
    printf"\nInstall Kubernetes on Mac.\n\n"
    check_os_for_mac

    check_minikube
    check_kubectl

    start=$(date +%s)
    echo "Started installing Kubernetes at $(date)"

    install_minikube
    install_kubernetes
    tput setaf 2; echo "Successfully installed Kubernetes at $(date)"; tput sgr0

    end=$(date +%s)
    echo "Finished installing Kubernetes at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

install_kubernetes
