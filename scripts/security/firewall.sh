#!/bin/bash

clear

. "$(dirname "$(readlink -f "$0")")/../../lib/styles.sh"
. "$(dirname "$(readlink -f "$0")")/../../lib/colors.sh"

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR"

FILENAME=$(basename "$0")

while true; do
    echo "Security Options"
    echo ""
    echo "  $(colored_text "Install" magenta)"
    echo "      1) Install and enable UFW (Uncomplicated Firewall)"
    echo "      2) Install and enable iptables"
    echo "  $(colored_text "Configure" cyan)"
    echo "      3) Enable outgoing and disable incoming connections"
    echo "      4) Configure iptables (Basic)"
    echo ""
    echo "  $(colored_text "0) Back" red)"
    echo ""
    read -p "Please enter your choice: " choice
    
    case $choice in
        1)
            echo "$(colored_text "Installing and enabling UFW..." green)"
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

            sudo systemctl enable ufw
            sudo systemctl start ufw
            sudo ufw --force enable

            echo "$(colored_text "Finished installing and configuring basic UFW." green)"
            break
            ;;
        2)
            echo "$(colored_text "Installing and enabling iptables..." green)"
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

            sudo systemctl enable iptables >/dev/null 2>&1
            sudo systemctl start iptables >/dev/null 2>&1
            break
            ;;
        3)

            sudo ufw default deny incoming
            sudo ufw default allow outgoing
            sudo ufw allow OpenSSH
            sleep 1;
            sudo bash "$WORKING_DIR/$FILENAME"
            break
            ;;
        4)
            sudo iptables -A INPUT -i lo -j ACCEPT
            sudo iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED
            sudo iptables -A INPUT -p icmp -j ACCEPT
            sudo iptables -A INPUT -j REJECT --reject-with icmp-host-unreachable
            break
            ;;
        0)
            sudo bash "$WORKING_DIR/index.sh"
            break
            ;;
        *)
            echo "$(colored_text "Invalid option. Please try again." red)"
            sleep 1
            clear
            ;;
    esac
done