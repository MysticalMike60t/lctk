#!/bin/bash

clear

echo "Disabling root login via SSH..."
echo ""

if ! command -v sshd >/dev/null; then
    echo "OpenSSH server not found — installing..."
    if command -v apt >/dev/null; then
        sudo apt update && sudo apt install openssh-server -y
    elif command -v dnf >/dev/null; then
        sudo dnf upgrade --refresh -y && sudo dnf install openssh-server -y
    elif command -v yum >/dev/null; then
        sudo yum update -y && sudo yum install openssh-server -y
    elif command -v pacman >/dev/null; then
        sudo pacman -Syu --noconfirm openssh
    elif command -v zypper >/dev/null; then
        sudo zypper refresh && sudo zypper install -y openssh
    elif command -v apk >/dev/null; then
        sudo apk update && sudo apk add openssh
    elif command -v emerge >/dev/null; then
        sudo emerge --sync && sudo emerge net-misc/openssh
    elif command -v xbps-install >/dev/null; then
        sudo xbps-install -Suv openssh
    elif command -v eopkg >/dev/null; then
        sudo eopkg install openssh
    elif command -v slackpkg >/dev/null; then
        sudo slackpkg update && sudo slackpkg install openssh
    else
        echo "Error: No supported package manager found!"
        exit 1
    fi
else
    echo "OpenSSH server is already installed."
fi

# Disable root login
echo "Disabling root login in SSH config..."
sudo sed -i 's/#\?PermitRootLogin\s\+.*/PermitRootLogin no/' /etc/ssh/sshd_config

# Restart SSH service (name can vary)
echo "Restarting SSH service..."
if systemctl list-units --type=service | grep -q sshd.service; then
    sudo systemctl restart sshd
elif systemctl list-units --type=service | grep -q ssh.service; then
    sudo systemctl restart ssh
else
    echo "Could not detect SSH service name, please restart manually."
fi

echo "SSH configuration updated — root login is now disabled."