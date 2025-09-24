#!/bin/bash

clear

. "$(dirname "$(readlink -f "$0")")/lib/styles.sh"
. "$(dirname "$(readlink -f "$0")")/lib/colors.sh"

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR/install_scripts"

while true; do
    echo "Install CPTK"
    echo ""
    echo "  $(colored_text "1) Install from local files" green)"
    echo "  $(colored_text "2) Install from online repository" yellow)"
    echo ""
    echo "  $(colored_text "0) Quit" red)"
    echo ""
    read -p "Please enter your choice: " choice
    
    case $choice in
        1)
            sudo bash "$WORKING_DIR/local.sh"
            break
            ;;
        2)
            sudo bash "$WORKING_DIR/online.sh"
            break
            ;;
        0)
            exit 0
            break
            ;;
        *)
            echo "$(colored_text "Invalid option. Please try again." red)"
            sleep 1
            clear
            ;;
    esac
done