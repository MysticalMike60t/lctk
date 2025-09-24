#!/bin/bash

clear

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR"

while true; do
    echo "Network Options"
    echo ""
    echo "1) MAC Randomization"
    echo "2) Back"
    echo ""
    read -p "Please enter your choice: " choice
    
    case $choice in
        1)
            echo "you chose MAC Randomization"
            break
            ;;
        2)
            sudo sh "$WORKING_DIR/../../start.sh"
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            sleep 1
            clear
            ;;
    esac
done