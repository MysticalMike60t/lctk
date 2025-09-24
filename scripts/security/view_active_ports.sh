#!/bin/sh

clear

. "$(dirname "$(readlink -f "$0")")/../../lib/styles.sh"
. "$(dirname "$(readlink -f "$0")")/../../lib/colors.sh"

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR"

echo "$(colored_text "Checking active ports..." green)"
echo ""

sudo ss -tuln | awk 'NR>1 {print $1, $5}' | while read -r protocol port; do
    case "$port" in
        *:*)
            port=$(echo "$port" | cut -d':' -f2)
            ;;
    esac
    echo "Protocol: $(colored_text "$protocol" cyan), Port: $(colored_text "$port" magenta)"
done

echo ""
read -rp "Press any key to continue..." _
echo ""
sudo bash "$WORKING_DIR/index.sh"