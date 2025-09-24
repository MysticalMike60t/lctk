#!/bin/bash

clear

. "$(dirname "$(readlink -f "$0")")/../../lib/styles.sh"
. "$(dirname "$(readlink -f "$0")")/../../lib/colors.sh"

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR"

while true; do
    echo "Storage Options"
    echo ""
    echo "  $(colored_text "0) Back" red)"
    echo ""
    read -p "Please enter your choice: " choice
    
    case $choice in
        0)
            sudo bash "$WORKING_DIR/../../start.sh"
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            sleep 1
            clear
            ;;
    esac
done