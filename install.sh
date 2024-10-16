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
        echo "# Detected OS: $NAME $VERSION"
    else
        echo "Cannot detect OS version."
        exit 1
    fi
}
echo "Checking OS..."
detect_os

install_proxmox_debian(){
    echo "This debian"
}

install_proxmox_ubuntu(){
    echo "This ubuntu"
}

install_proxmox_on(){
    if ["$OS" == "Debian"]; then
        install_proxmox_debian
    elif ["$OS" == "Ubuntu"]; then
        install_proxmox_ubuntu
    else 
        echo "This script only support Debian and Ubuntu"
        exit 1
    fi
}

install_proxmox_on


