#!/bin/bash

clear

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR/scripts"

. "$SCRIPT_DIR/lib/styles.sh"

while true; do
    echo "Linux Configuration Toolkit"
    echo ""
    echo -e "   ${FG_YELLOW}m1) Package Options${RESET_ALL}"
    echo -e "   ${FG_YELLOW}m2) Security Options${RESET_ALL}"
    echo -e "   ${FG_YELLOW}m3) Storage Options${RESET_ALL}"
    echo -e "   ${FG_YELLOW}m4) Network Options${RESET_ALL}"
    echo ""
    echo -e "   ${FG_RED}m5) Quit${RESET_ALL}"
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