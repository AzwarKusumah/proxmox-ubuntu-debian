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
 echo -e "\e[31mRyuko: Adding Proxmox VE Sourcelist...Red Text\e[0m"
        echo "deb [arch=amd64] http://download.proxmox.com/debian/pve bookworm pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list

        echo -e "\e[31mRyuko: Adding Proxmox VE repository Key...\e[0m"
        wget https://enterprise.proxmox.com/debian/proxmox-release-bookworm.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg

        echo -e "\e[31mRyuko: Verify your key...\e[0m"
        sha512sum /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg

        echo -e "\e[31mRyuko: Updating and Upgrading your system...\e[0m"
        apt update && apt full-upgrade-y

        echo -e "\e[31mRyuko: Install Proxmox VE kernel...\e[0m"
        apt install proxmox-default-kernel -y

        echo -e "\e[31mRyuko: Install Proxmox VE packages...\e[0m"
        apt install proxmox-ve postfix open-iscsi chrony -y

        echo -e "\e[31mRyuko: Remove debian kernel...\e[0m"
        apt remove linux-image-amd64 'linux-image-6.1*' -y

        echo -e "\e[31mRyuko: Update Grub...\e[0m"
        update-grub

        read  -p "Ryuko: Would you like to remove os-prober? (y/n)" osprober_choice
        if [ "$osprober_choice" = "y" ]; then
                echo -e "\e[31mRyuko: Remove os-prober\e[0m"
                apt remove os-prober -y
        fi
        read -p "Ryuko: Proxmox VE configuration is complete. Would you like to reboot now? (y/n): " reboot_choice
        if [ "$reboot_choice" = "y" ]; then
                reboot
        fi

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


