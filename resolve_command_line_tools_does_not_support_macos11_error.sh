#!/bin/bash

# resolve Command Line Tools does not support macOS 11 error

# update software
softwareupdate --all --install --force

# delete CommandLineTools directory
sudo rm -rf /Library/Developer/CommandLineTools/

# reinstall Command Line Tools 
sudo xcode-select --install
