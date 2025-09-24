#!/bin/bash

clear

echo "Checking for curl..."
which curl &> /dev/null || sudo apt install curl

clear

. "$(dirname "$(readlink -f "$0")")/lib/styles.sh"
. "$(dirname "$(readlink -f "$0")")/lib/colors.sh"

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR/../"

echo "Uninstall"

if [ -e /usr/local/bin/lctk ]
then
    echo "$(colored_text "Uninstalling from /usr/local/bin/lctk..." green)"
    sudo rm -rf /usr/local/bin/lctk
    if [ ! -e /usr/local/bin/lctk ]
    then
        echo "$(colored_text "Uninstalled /usr/local/bin/lctk" green)"
    else
        echo "$(colored_text "Failed to uninstall /usr/local/bin/lctk" red)"
        sleep 2
        exit 0
    fi
    sudo rm -rf /usr/local/bin/lctk-start
    if [ ! -e /usr/local/bin/lctk-start ]
    then
        echo "$(colored_text "Uninstalled /usr/local/bin/lctk-start" green)"
    else
        echo "$(colored_text "Failed to uninstall /usr/local/bin/lctk-start" red)"
        sleep 2
        exit 0
    fi
else
    echo "$(colored_text "I don't know where LCTK is installed." red)"
    sleep 2
    exit 0
fi