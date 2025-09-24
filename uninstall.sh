#!/bin/bash

clear

echo "Checking for curl..."
which curl &> /dev/null || sudo apt install curl

clear

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR/../"

echo "Uninstall"

if [ -e /usr/local/bin/lctk ]
then
    echo "Uninstalling from /usr/local/bin/lctk..."
    sudo rm -rf /usr/local/bin/lctk
    if [ ! -e /usr/local/bin/lctk ]
    then
        echo "Uninstalled /usr/local/bin/lctk"
    else
        echo "Failed to uninstall /usr/local/bin/lctk"
        sleep 2
        exit 0
    fi
    sudo rm -rf /usr/local/bin/lctk-start
    if [ ! -e /usr/local/bin/lctk-start ]
    then
        echo "Uninstalled /usr/local/bin/lctk-start"
    else
        echo "Failed to uninstall /usr/local/bin/lctk-start"
        sleep 2
        exit 0
    fi
else
    echo "I don't know where LCTK is installed."
    sleep 2
    exit 0
fi