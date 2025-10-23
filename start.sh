#!/bin/bash

clear

. "$(dirname "$(readlink -f "$0")")/lib/styles.sh"
. "$(dirname "$(readlink -f "$0")")/lib/colors.sh"
. "$(dirname "$(readlink -f "$0")")/lib/info.sh"

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR/scripts"

if [ "$1" == "version" ]
then
    if [[ "$VERSION_MAJOR" -lt 1 ]]
    then
        echo "LCTK Version $(colored_text "$VERSION" yellow)"
    else
        echo "LCTK Version $(colored_text "$VERSION" green)"
    fi
    exit 0
else
    if [[ "$VERSION_MAJOR" -lt 1 ]]
    then
        echo "LCTK Version $(colored_text "$VERSION" yellow)"
    else
        echo "LCTK Version $(colored_text "$VERSION" green)"
    fi
    echo ""
fi

while true; do
    echo "$(colored_text "Linux Configuration Toolkit" blue)"
    echo ""
    echo "   1) Package Options"
    echo "   2) Security Options"
    echo "   3) Storage Options"
    echo "   4) Network Options"
    echo "   5) Security Guide"
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
        5)
            xdg-open "$WORKING_DIR/security_guide/index.html"
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