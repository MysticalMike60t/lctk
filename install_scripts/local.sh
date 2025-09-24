#!/bin/bash

clear

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR/../"

while true; do
    echo "Install to:"
    echo ""
    echo "1) /usr/local/bin/lctk"
    echo "2) Cancel"
    echo ""
    read -p "Please enter your choice: " choice
    
    case $choice in
        1)
            echo "Installing to /usr/local/bin/lctk..."
            sudo mkdir -p /usr/local/bin/lctk
            if [ -e /usr/local/bin/lctk ]
            then
                echo "Created /usr/local/bin/lctk"
            else
                echo "Failed to create /usr/local/bin/lctk"
                sleep 2
                exit 0
            fi
            sudo cp -r "$WORKING_DIR/scripts" "/usr/local/bin/lctk/scripts"
            if [ -e /usr/local/bin/lctk/scripts ]
            then
                echo "Installed scripts to /usr/local/bin/lctk/scripts"
            else
                echo "Failed to install scripts"
                sleep 2
                exit 0
            fi
            sudo cp -r "$WORKING_DIR/lib" "/usr/local/bin/lctk/lib"
            if [ -e /usr/local/bin/lctk/lib ]
            then
                echo "Installed lib to /usr/local/bin/lctk/lib"
            else
                echo "Failed to install lib"
                sleep 2
                exit 0
            fi
            sudo cp -r "$WORKING_DIR/start.sh" "/usr/local/bin/lctk/start.sh"
            if [ -e /usr/local/bin/lctk/start.sh ]
            then
                echo "Installed start.sh to /usr/local/bin/lctk/start.sh"
            else
                echo "Failed to install start.sh"
                sleep 2
                exit 0
            fi
            chmod +x /usr/local/bin/lctk/start.sh
            chmod +x /usr/local/bin/lctk/scripts/*/*.sh
            chmod +x /usr/local/bin/lctk/lib/*/*.sh
            sudo ln -s /usr/local/bin/lctk/start.sh /usr/local/bin/lctk-start
            break
            ;;
        2)
            exit 0
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            sleep 1
            clear
            ;;
    esac
done