#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__|
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo -e "\nInstalling Base System\n"

PKGS=(

    # --- XORG Display Rendering
        'xorg'                  # Base Package
        'xorg-drivers'          # Display Drivers
        'xorg-server'           # XOrg Server
        'xorg-apps'             # XOrg Apps Group
        'xorg-xinit'            # XOrg Init
        'xorg-xinput'           # Xorg Xinput
        'mesa'                  # Open Source Version of OpenGL

    # --- Setup Desktop
        'awesome'               # Awesome Desktop
        'xfce4-power-manager'   # Power Manager
        'dmenu'                 # Menu System
        'picom'                 # Translucent Windows
        'xclip'                 # System Clipboard
        'lxsession'             # Elevate Applications
        'lxappearance'          # Set System Themes

    # --- Login Display Manager
        'lightdm'                       # Base Login Manager
        'light-locker'                  # LightDM screen locker
        'lightdm-webkit2-greeter'       # Framework for Awesome Login Themes
        'lightdm-webkit-theme-litarvan' # Lightdm Login Theme - https://github.com/NoiSek/Aether#installation

    # --- Networking Setup
        'wpa_supplicant'            # Key negotiation for WPA Wireless Networks
        'dialog'                    # Enables Shell Scripts To Trigger Dialog Boxex
        # 'openvpn'                   # Open VPN support
        # 'networkmanager-openvpn'    # Open VPN Plugin for NM
        'network-manager-applet'    # System Tray Icon/Utility for Network Connectivity
        'libsecret'                 # Library For Storing Passwords

    # --- Audio
        'alsa-utils'        # Advanced Linux Sound Architecture (ALSA) Components https://alsa.opensrc.org/
        'alsa-plugins'      # ALSA Plugins
        'pulseaudio'        # Pulse Audio Sound Components
        'pulseaudio-alsa'   # ALSA Configuration for Pulse Audio
        'pavucontrol'       # Pulse Audio Volume Control
        'pnmixer'           # System Tray Volume Control

    # --- Bluetooth
        'bluez'                 # Daemons for the Bluetooth Protocol Stack
        'bluez-utils'           # Bluetooth Development and Debugging Utilities
        'bluez-firmware'        # Firmwares for Broadcom BCM203x and STLC2300 Bluetooth Chips
        'blueberry'             # Bluetooth Configuration Tool
        'pulseaudio-bluetooth'  # Bluetooth Support for PulseAudio

    # --- Printers
        'cups'                  # Open Source Printer Drivers
        'cups-pdf'              # PDF Support For Cups
        'ghostscript'           # PostScript Interpreter
        'gsfonts'               # Adobe Postscript Replacement Fonts
        'hplip'                 # HP Drivers
        'system-config-printer' # Printer Setup  Utility
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo -e "\nDone!\n"
