#!/bin/bash

clear

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR"

. "$SCRIPT_DIR/../../lib/styles.sh"

while true; do
    echo "Security Options"
    echo ""
    echo "      1) Firewall options"
    echo ""
    echo "  ${FG_BR_YELLOW}mActions${RESET_ALL}"
    echo ""
    echo "      2) Disable root login via SSH"
    echo ""
    echo "  ${FG_MAGENTA}mMonitoring${RESET_ALL}"
    echo ""
    echo "      3) View active ports"
    echo ""
    echo "  ${FG_RED}m4) Back${RESET_ALL}"
    echo ""
    read -p "Please enter your choice: " choice
    
    case $choice in
        1)
            sudo sh "$WORKING_DIR/firewall.sh"
            break
            ;;
        2)
            sudo sh "$WORKING_DIR/ssh_disable_root.sh"
            break
            ;;
        3)
            sudo sh "$WORKING_DIR/view_active_ports.sh"
            break
            ;;
        4)
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