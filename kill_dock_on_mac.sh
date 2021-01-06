#!/bin/bash
set -e

#kill the dock
defaults delete com.apple.dock;
killall Dock