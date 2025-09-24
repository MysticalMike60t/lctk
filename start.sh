#!/bin/bash

clear

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR/scripts"

while true; do
    echo "Linux Configuration Toolkit"
    echo ""
    echo "1) Package Options"
    echo "2) Security Options"
    echo "3) Storage Options"
    echo "4) Network Options"
    echo "5) Quit"
    echo ""
    read -p "Please enter your choice: " choice
    
    case $choice in
        1)
            sudo sh "$WORKING_DIR/packages/index.sh"
            break
            ;;
        2)
            sudo sh "$WORKING_DIR/security/index.sh"
            break
            ;;
        3)
            sudo sh "$WORKING_DIR/storage/index.sh"
            break
            ;;
        4)
            sudo sh "$WORKING_DIR/network/index.sh"
            break
            ;;
        5)
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            sleep 1
            clear
            ;;
    esac
done