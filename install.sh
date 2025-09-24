#!/bin/bash

clear

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR/install_scripts"

while true; do
    echo "Install CPTK"
    echo ""
    echo "1) Install from local files"
    echo "2) Install from online repository"
    echo "3) Quit"
    echo ""
    read -p "Please enter your choice: " choice
    
    case $choice in
        1)
            sudo sh "$WORKING_DIR/local.sh"
            break
            ;;
        2)
            sudo sh "$WORKING_DIR/online.sh"
            break
            ;;
        3)
            exit 0
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            sleep 1
            clear
            ;;
    esac
done