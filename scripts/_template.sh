#!/bin/bash

clear

. "$(dirname "$(readlink -f "$0")")/../../lib/styles.sh"
. "$(dirname "$(readlink -f "$0")")/../../lib/colors.sh"

# Prints the directory where this script is located
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
# Modify working location based off of script location
WORKING_DIR="$SCRIPT_DIR"

CATEGORY_NAME="Storage"

while true; do
    echo "$CATEGORY_NAME Options"
    echo ""
    echo "  $(colored_text "1) Back" red)"
    echo ""
    read -p "Please enter your choice: " choice
    
    case $choice in
        1)
            sudo bash "$WORKING_DIR/../../start.sh"
            break
            ;;
        *)
            echo "$(colored_text "Invalid option. Please try again." red)"
            sleep 1
            clear
            ;;
    esac
done