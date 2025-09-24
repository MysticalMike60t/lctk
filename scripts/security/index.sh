#!/bin/bash

clear

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR"

while true; do
    echo "Security Options"
    echo ""
    echo "1) Disable root login via SSH"
    echo "2) Firewall options"
    echo "3) Back"
    echo ""
    read -p "Please enter your choice: " choice
    
    case $choice in
        1)
            sudo sh "$WORKING_DIR/ssh_disable_root.sh"
            break
            ;;
        2)
            sudo sh "$WORKING_DIR/firewall.sh"
            break
            ;;
        3)
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