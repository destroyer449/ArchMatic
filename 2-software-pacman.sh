#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__|
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo -e "\nINSTALLING SOFTWARE\n"

PKGS=(

    # TERMINAL UTILITIES --------------------------------------------------

    'cronie'                # Cron Jobs
    'curl'                  # Remote Content Retrieval
    'file-roller'           # Archive Utility
    'firewalld'             # Firewall Manager
    'htop'                  # Process Viewer
    'neofetch'              # Shows System Info When You Launch Terminal
    'ntp'                   # Network Time Protocol To Set Time Via Network.
    'numlockx'              # Turns On Numlock In X11
    'openssh'               # SSH Connectivity Tools
    'p7zip'                 # 7z Compression Program
    'lzop'                  # Lzo Compression
    'rsync'                 # Remote File Sync Utility
    'tlp'                   # Advanced Laptop Power Management
    'unrar'                 # RAR Compression Program
    'unzip'                 # Zip Compression Program
    'wget'                  # Remote Content Retrieval
    'alacritty'             # Terminal Emulator
    'zip'                   # Zip Compression Program
    'zsh'                   # ZSH Shell
    'zsh-completions'       # Tab Completion for ZSH
    'tmux'                  # Terminal Multiplexer

    # DISK UTILITIES ------------------------------------------------------

    'autofs'                # Auto-mounter
    'btrfs-progs'           # BTRFS Support
    'dosfstools'            # DOS Support
    'exfat-utils'           # Mount exFat Drives
    'gvfs'                  # Disk Utility
    'gvfs-mtp'              # Read MTP Connected Systems
    'gvfs-smb'              # More File System Stuff
    'parted'                # Disk Utility
    'samba'                 # Samba File Sharing
    'smartmontools'         # Disk Monitoring
    'smbclient'             # SMB Connection

    # GENERAL UTILITIES ---------------------------------------------------

    'scrot'                 # Screenshots
    'freerdp'               # RDP Connections
    'libvncserver'          # VNC Connections
    'pcmanfm'               # Filesystem Browser
    'vifm'                  # ViM Based File Manager
    'ueberzug'              # Terminal File Viewer
    'remmina'               # Remote Connection
    'veracrypt'             # Disc Encryption Utility
    'nitrogen'              # Wallpaper Changer
    'dunst'                 # Notification Server
    'isync'                 # Syncs Mail
    'qalculate-gtk'         # Calculator

    # DEVELOPMENT ---------------------------------------------------------

    'clang'                 # C Lang Compiler
    'ccls'                  # C/C++ Language Server
    'gcc'                   # C/C++ Compiler
    'glibc'                 # C Libraries
    'git'                   # Version Control System
    'gradle'                # Java Build Manager
    'yarn'                  # NPM Package Manager
    'python'                # Scripting Language
    'python-pip'            # Python Package Manager
    'ripgrep'               # Rust Implementation of Grep
    'fd'                    # Rust Implementation of Find
    'exa'                   # Rust Implementation of Ls
    'fzf'                   # Command Line Fuzzy-Finder
    'hub'                   # Github CLI
    'languagetool'          # Opensource Language Checker

    # MEDIA ---------------------------------------------------------------

    'kdenlive'              # Movie Render
    'vlc'                   # Video Player
    'obs-studio'            # Screen Recorder

    # GRAPHICS AND DESIGN -------------------------------------------------

    'inkscape'              # Vector Graphics Manipulation
    'gimp'                  # GNU Image Manipulation Program
    'blender'               # Open Source Modeling and Sculpting Software

    # PRODUCTIVITY --------------------------------------------------------

    'aspell'                # Spellcheck Libraries
    'aspell-en'             # English Spellcheck Library
    'zathura'               # PDF Viewer
    'libreoffice-fresh'     # Office Alternative
    'firefox'               # Browser

    # Virtualization ------------------------------------------------------
    'qemu'                  # Hypervisor
    'libvirt'               # QEMU Frontend API
    'virt-manager'          # QEMU Frontend
    'dmidecode'             # Desktop Management for Libvirt
    'edk2-ovmf'             # UEFI On QEMU
    'dnsmasq'               # Networking for QEMU
    'ebtables'              # Network Bridging

)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo -e "\nDone!\n"
