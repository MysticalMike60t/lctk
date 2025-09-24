#!/bin/sh

clear

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR"

echo "Checking active ports..."

sudo ss -tuln | awk 'NR>1 {print $1, $5}' | while read -r protocol port; do
    case "$port" in
        *:*)
            port=$(echo "$port" | cut -d':' -f2)
            ;;
    esac
    echo "Protocol: $protocol, Port: $port"
done

echo ""
read -rp "Press any key to continue..." _
echo ""
sudo sh "$WORKING_DIR/index.sh"