#!/bin/bash

#Banner

echo "██████╗ ██╗   ██╗██╗   ██╗██╗  ██╗ ██████╗ ███╗   ███╗ ██████╗ ██╗  ██╗"          
echo "██╔══██╗╚██╗ ██╔╝██║   ██║██║ ██╔╝██╔═══██╗████╗ ████║██╔═══██╗╚██╗██╔╝"          
echo "██████╔╝ ╚████╔╝ ██║   ██║█████╔╝ ██║   ██║██╔████╔██║██║   ██║ ╚███╔╝ "
echo "██╔══██╗  ╚██╔╝  ██║   ██║██╔═██╗ ██║   ██║██║╚██╔╝██║██║   ██║ ██╔██╗ "
echo "██║  ██║   ██║   ╚██████╔╝██║  ██╗╚██████╔╝██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗"
echo "╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝"
echo "                                                                       "
echo "        === Proxmox VE Ubuntu or Debian Installation Script ===        "

detect_os() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$ID
        VERSION=$VERSION_ID
        echo "Detected OS: $NAME $VERSION"
    else
        echo "Cannot detect OS version."
        exit 1
    fi
}
echo "Checking OS..."
detect_os


