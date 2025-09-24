#!/bin/bash

clear

# Prints the directory where this script is located
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
# Modify working location based off of script location
WORKING_DIR="$SCRIPT_DIR"

CATEGORY_NAME="Storage"

while true; do
    echo "$CATEGORY_NAME Options"
    echo ""
    echo "1) Back"
    echo ""
    read -p "Please enter your choice: " choice
    
    case $choice in
        1)
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