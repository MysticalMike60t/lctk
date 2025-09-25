#!/bin/bash

clear

echo "Checking for curl..."
which curl &> /dev/null || sudo apt install curl

clear

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR"

while true; do
    echo "Install to:"
    echo ""
    echo "1) /usr/local/bin/lctk"
    echo "0) Cancel"
    echo ""
    read -p "Please enter your choice: " choice
    
    case $choice in
        1)
            echo "Installing to /usr/local/bin/lctk..."
            curl -L -o "$WORKING_DIR/lctk.zip" "https://github.com/MysticalMike60t/lctk/archive/refs/heads/main.zip"
            unzip "$WORKING_DIR/lctk.zip" -d "/usr/local/bin/"
            sudo cp -r /usr/local/bin/lctk-main /usr/local/bin/lctk/
            if [ -e /usr/local/bin/lctk ]
            then
                echo "Created /usr/local/bin/lctk"
            else
                echo "Failed to create /usr/local/bin/lctk"
                sleep 2
                exit 0
            fi
            sudo rm -rf /usr/local/bin/lctk-main
            sudo rm -rf "$WORKING_DIR/lctk.zip"
            sudo rm -rf /usr/local/bin/lctk/install.sh
            sudo rm -rf /usr/local/bin/lctk/uninstall.sh
            sudo rm -rf /usr/local/bin/lctk/.gitattributes
            sudo rm -rf /usr/local/bin/lctk/README.md
            sudo rm -rf /usr/local/bin/lctk/install_scripts
            sudo rm -rf /usr/local/bin/lctk/.git
            chmod +x /usr/local/bin/lctk/start.sh
            chmod +x /usr/local/bin/lctk/scripts/*/*.sh
            chmod +x /usr/local/bin/lctk/lib/*.sh
            sudo ln -s /usr/local/bin/lctk/start.sh /usr/local/bin/lctk-start
            break
            ;;
        0)
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