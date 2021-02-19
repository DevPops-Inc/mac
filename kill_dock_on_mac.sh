#!/bin/bash
set -e

# kill dock on Mac

defaults delete com.apple.dock;

killall Dock
