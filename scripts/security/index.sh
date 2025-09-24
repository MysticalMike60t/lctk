#!/bin/bash

clear

. "$(dirname "$(readlink -f "$0")")/../../lib/styles.sh"
. "$(dirname "$(readlink -f "$0")")/../../lib/colors.sh"

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR"

while true; do
    echo "Security Options"
    echo ""
    echo "   $(colored_text "Options" cyan)"
    echo "      1) Firewall options"
    echo "   $(colored_text "Actions" yellow)"
    echo "      2) Disable root login via SSH"
    echo "   $(colored_text "Monitoring" magenta)"
    echo "      3) View active ports"
    echo ""
    echo "   $(colored_text "0) Back" red)"
    echo ""
    read -p "Please enter your choice: " choice
    
    case $choice in
        1)
            sudo bash "$WORKING_DIR/firewall.sh"
            break
            ;;
        2)
            sudo bash "$WORKING_DIR/ssh_disable_root.sh"
            break
            ;;
        3)
            sudo bash "$WORKING_DIR/view_active_ports.sh"
            break
            ;;
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