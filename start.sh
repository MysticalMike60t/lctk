#!/bin/bash

clear

. "$(dirname "$(readlink -f "$0")")/lib/styles.sh"
. "$(dirname "$(readlink -f "$0")")/lib/colors.sh"

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR/scripts"

while true; do
    echo "$(colored_text "Linux Configuration Toolkit" blue)"
    echo ""
    echo "   $(colored_text "1) Package Options" white)"
    echo "   $(colored_text "2) Security Options" white)"
    echo "   $(colored_text "3) Storage Options" white)"
    echo "   $(colored_text "4) Network Options" white)"
    echo ""
    echo "   $(colored_text "0) Quit" red)"
    echo ""
    read -p "Please enter your choice: " choice
    
    case $choice in
        1)
            sudo bash "$WORKING_DIR/packages/index.sh"
            break
            ;;
        2)
            sudo bash "$WORKING_DIR/security/index.sh"
            break
            ;;
        3)
            sudo bash "$WORKING_DIR/storage/index.sh"
            break
            ;;
        4)
            sudo bash "$WORKING_DIR/network/index.sh"
            break
            ;;
        0)
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            sleep 1
            clear
            ;;
    esac
done