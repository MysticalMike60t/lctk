#!/bin/bash

clear

echo "Checking for curl..."
which curl &> /dev/null || sudo apt install curl

clear

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR"

while true; do
    echo "Update"
    echo ""
    if [ -e /usr/local/bin/lctk ]
    then
        echo "1) /usr/local/bin/lctk"
    else
        echo "LCTK not installed. Nothing to update."
        sleep 2
        exit 0
    fi
    echo ""
    echo "0) Cancel"
    echo ""
    read -p "Please enter your choice: " choice
    
    case $choice in
        1)
            if [ -e /usr/local/bin/lctk ]
            then
                echo "Deleting old version..."
                sudo rm -rf /usr/local/bin/lctk
                if [ ! -e /usr/local/bin/lctk ]
                then
                    echo "Uninstalled /usr/local/bin/lctk"
                else
                    echo "Failed to uninstall /usr/local/bin/lctk"
                    sleep 2
                    exit 0
                fi
                sudo rm -rf /usr/local/bin/lctk-start
                if [ ! -e /usr/local/bin/lctk-start ]
                then
                    echo "Uninstalled /usr/local/bin/lctk-start"
                else
                    echo "Failed to uninstall /usr/local/bin/lctk-start"
                    sleep 2
                    exit 0
                fi
                sudo rm -rf /usr/local/bin/lctk-update
                if [ ! -e /usr/local/bin/lctk-update ]
                then
                    echo "Uninstalled /usr/local/bin/lctk-update"
                else
                    echo "Failed to uninstall /usr/local/bin/lctk-update"
                    sleep 2
                    exit 0
                fi

                if [ -e /usr/local/bin/lctk-main ]
                then
                    sudo rm -rf /usr/local/bin/lctk-main
                else
                    echo "/usr/local/bin/lctk-main does not exist, continuing..."
                fi

                echo "Downloading latest version..."
                # Ensure we can write to the working directory, use /tmp if not
                if [ ! -w "$WORKING_DIR" ]; then
                    WORKING_DIR="/tmp"
                fi
                curl -L -o "$WORKING_DIR/lctk.zip" "https://github.com/MysticalMike60t/lctk/archive/refs/heads/main.zip"
                if [ ! -f "$WORKING_DIR/lctk.zip" ]; then
                    echo "Failed to download LCTK archive"
                    sleep 2
                    exit 1
                fi
                sudo unzip "$WORKING_DIR/lctk.zip" -d "/usr/local/bin/"
                if [ ! -d "/usr/local/bin/lctk-main" ]; then
                    echo "Failed to extract LCTK archive"
                    sudo rm -f "$WORKING_DIR/lctk.zip"
                    sleep 2
                    exit 1
                fi
                sudo cp -r /usr/local/bin/lctk-main /usr/local/bin/lctk
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
                sudo rm -rf /usr/local/bin/lctk/.gitattributes
                sudo rm -rf /usr/local/bin/lctk/README.md
                sudo rm -rf /usr/local/bin/lctk/install_scripts
                sudo rm -rf /usr/local/bin/lctk/.git
                sudo chmod +x /usr/local/bin/lctk/start.sh
                sudo chmod +x /usr/local/bin/lctk/uninstall.sh
                sudo chmod +x /usr/local/bin/lctk/update.sh
                sudo chmod +x /usr/local/bin/lctk/scripts/*/*.sh
                sudo chmod +x /usr/local/bin/lctk/lib/*.sh
                sudo ln -s /usr/local/bin/lctk/start.sh /usr/local/bin/lctk-start
                sudo ln -s /usr/local/bin/lctk/update.sh /usr/local/bin/lctk-update
            else
                echo "LCTK not installed. Nothing to update."
                sleep 2
                exit 0
            fi
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