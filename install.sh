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
    if [ "$VERSION" = "12" ]; then
        echo "Ryuko: Adding Proxmox VE Sourcelist..."
        echo "deb [arch=amd64] http://download.proxmox.com/debian/pve bookworm pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list

        echo "Ryuko: Adding Proxmox VE repository Key..."
        wget https://enterprise.proxmox.com/debian/proxmox-release-bookworm.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg

        echo "Ryuko: Verify your key..."
        sha512sum /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg 

        echo "Ryuko: Updating and Upgrading your system..."
        apt update && apt full-upgrade-y
        
    elif [ "$VERSION" = "11" ]; then

    else
        echo "There is no version"
        exit
    fi
}

install_proxmox_ubuntu(){
    echo "This ubuntu"
}

install_proxmox_on(){
    if [ "$OS" = "debian" ]; then
        install_proxmox_debian
    elif [ "$OS" = "ubuntu" ]; then
        install_proxmox_ubuntu
    else 
        echo "This script only support Debian and Ubuntu"
        exit 1
    fi
}

install_proxmox_on


