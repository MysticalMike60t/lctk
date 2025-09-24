#!/bin/bash

clear

. "$(dirname "$(readlink -f "$0")")/../../lib/styles.sh"
. "$(dirname "$(readlink -f "$0")")/../../lib/colors.sh"

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR"

while true; do
    echo "Network Options"
    echo ""
    echo "  1) MAC Randomization"
    echo ""
    echo "  $(colored_text "0) Back" red)"
    echo ""
    read -p "Please enter your choice: " choice
    
    case $choice in
        1)
            clear
            echo "$(colored_text "you chose MAC Randomization" green)"
            sleep 1
            sudo bash "$WORKING_DIR/index.sh"
            break
            ;;
        0)
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