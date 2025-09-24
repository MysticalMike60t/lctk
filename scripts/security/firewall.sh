#!/bin/bash

clear

echo "Checking for curl..."
which curl &> /dev/null || sudo apt install curl

clear

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR"

FILENAME=$(basename "$0")

while true; do
    echo "Security Options"
    echo ""
    echo "1) Install and enable UFW (Uncomplicated Firewall)"
    echo "2) Enable outgoing and disable incoming connections"
    echo "3) Install and enable iptables"
    echo "4) Configure iptables (Basic)"
    echo "5) Back"
    echo ""
    read -p "Please enter your choice: " choice
    
    case $choice in
        1)
            echo "Installing and enabling UFW..."
                if command -v apt >/dev/null; then
                    echo "Detected: APT (Debian/Ubuntu)"
                    sudo apt update && sudo apt install ufw -y

                elif command -v dnf >/dev/null; then
                    echo "Detected: DNF (Fedora/RHEL/CentOS)"
                    sudo dnf upgrade --refresh -y
                    sudo dnf install ufw -y
                    sudo systemctl disable --now firewalld >/dev/null 2>&1

                elif command -v yum >/dev/null; then
                    echo "Detected: YUM (Older Fedora/RHEL/CentOS)"
                    sudo yum update -y
                    sudo yum install ufw -y
                    sudo systemctl disable --now firewalld >/dev/null 2>&1

                elif command -v pacman >/dev/null; then
                    echo "Detected: Pacman (Arch/Manjaro)"
                    sudo pacman -Syu --noconfirm ufw

                elif command -v zypper >/dev/null; then
                    echo "Detected: Zypper (openSUSE/SLES)"
                    sudo zypper refresh && sudo zypper install -y ufw

                elif command -v apk >/dev/null; then
                    echo "Detected: APK (Alpine)"
                    sudo apk update && sudo apk add ufw

                elif command -v emerge >/dev/null; then
                    echo "Detected: Portage (Gentoo)"
                    sudo emerge --sync && sudo emerge net-firewall/ufw

                elif command -v xbps-install >/dev/null; then
                    echo "Detected: XBPS (Void Linux)"
                    sudo xbps-install -Suv ufw

                elif command -v eopkg >/dev/null; then
                    echo "Detected: EOPKG (Solus)"
                    sudo eopkg install ufw

                elif command -v slackpkg >/dev/null; then
                    echo "Detected: Slackpkg (Slackware)"
                    sudo slackpkg update && sudo slackpkg install ufw

                else
                    echo "❌ Error: No supported package manager found!"
                    break
                fi

            # Enable and configure UFW
            sudo systemctl enable ufw
            sudo systemctl start ufw
            sudo ufw --force enable

            echo "Finished installing and configuring basic UFW."
            break
            ;;
        2)

            sudo ufw default deny incoming
            sudo ufw default allow outgoing
            sudo ufw allow OpenSSH
            sleep 1;
            sudo sh "$WORKING_DIR/$FILENAME"
            break
            ;;
        3)
            echo "Installing and enabling iptables..."
            if command -v apt >/dev/null; then
                echo "Detected: APT (Debian/Ubuntu)"
                sudo apt update && sudo apt install iptables iptables-persistent -y

            elif command -v dnf >/dev/null; then
                echo "Detected: DNF (Fedora/RHEL/CentOS)"
                sudo dnf upgrade --refresh -y
                sudo dnf install iptables iptables-services -y
                sudo systemctl enable iptables
                sudo systemctl disable --now firewalld >/dev/null 2>&1

            elif command -v yum >/dev/null; then
                echo "Detected: YUM (Older Fedora/RHEL/CentOS)"
                sudo yum update -y
                sudo yum install iptables iptables-services -y
                sudo systemctl enable iptables
                sudo systemctl disable --now firewalld >/dev/null 2>&1

            elif command -v pacman >/dev/null; then
                echo "Detected: Pacman (Arch/Manjaro)"
                sudo pacman -Syu --noconfirm iptables

            elif command -v zypper >/dev/null; then
                echo "Detected: Zypper (openSUSE/SLES)"
                sudo zypper refresh && sudo zypper install -y iptables

            elif command -v apk >/dev/null; then
                echo "Detected: APK (Alpine)"
                sudo apk update && sudo apk add iptables

            elif command -v emerge >/dev/null; then
                echo "Detected: Portage (Gentoo)"
                sudo emerge --sync && sudo emerge net-firewall/iptables

            elif command -v xbps-install >/dev/null; then
                echo "Detected: XBPS (Void Linux)"
                sudo xbps-install -Suv iptables

            elif command -v eopkg >/dev/null; then
                echo "Detected: EOPKG (Solus)"
                sudo eopkg install iptables

            elif command -v slackpkg >/dev/null; then
                echo "Detected: Slackpkg (Slackware)"
                sudo slackpkg update && sudo slackpkg install iptables

            else
                echo "❌ Error: No supported package manager found!"
            fi

            # Enable and start iptables service (where applicable)
            sudo systemctl enable iptables >/dev/null 2>&1
            sudo systemctl start iptables >/dev/null 2>&1
            break
            ;;
        4)
            sudo iptables -A INPUT -i lo -j ACCEPT
            sudo iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED
            sudo iptables -A INPUT -p icmp -j ACCEPT
            sudo iptables -A INPUT -j REJECT --reject-with icmp-host-unreachable
            break
            ;;
        5)
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