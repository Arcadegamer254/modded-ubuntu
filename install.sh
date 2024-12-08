#!/bin/bash

# Detect architecture
ARCH=$(uname -m)
if [ "$ARCH" != "armv7l" ] && [ "$ARCH" != "aarch64" ]; then
    echo "This script is optimized for ARM devices only."
    exit 1
fi

# Update and install essential tools
echo "Updating system and installing tools..."
apt update && apt upgrade -y
apt install -y vim nano geany python3 python3-pip nodejs tigervnc-standalone-server lxde

# Set up VNC server
echo "Configuring VNC server..."
mkdir -p ~/.vnc
echo "password" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

# Display success message
echo "Installation complete! Use 'vncserver -geometry 1280x720' to start the GUI."
