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

    # SYSTEM --------------------------------------------------------------

    'linux-lts'             # Long Term Support Kernel

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
    'rsync'                 # Remote File Sync Utility
    'tlp'                   # Advanced Laptop Power Management
    'unrar'                 # RAR Compression Program
    'unzip'                 # Zip Compression Program
    'wget'                  # Remote Content Retrieval
    'alacritty'             # Terminal Emulator
    'neovim'                # Terminal Editor
    'zip'                   # Zip Compression Program
    'zsh'                   # ZSH Shell
    'zsh-completions'       # Tab Completion for ZSH
    'tmux'                  # Terminal Multiplexer

    # DISK UTILITIES ------------------------------------------------------

    'autofs'                # Auto-mounter
    'btrfs-progs'           # BTRFS Support
    'dosfstools'            # DOS Support
    'exfat-utils'           # Mount exFat Drives
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
    'remmina'               # Remote Connection
    'veracrypt'             # Disc Encryption Utility
    'nitrogen'              # Wallpaper Changer

    # DEVELOPMENT ---------------------------------------------------------

    'clang'                 # C Lang Compiler
    'premake'               # Replacement For CMake
    'git'                   # Version Control System
    'gcc'                   # C/C++ Compiler
    'gradle'                # Java Build Manager
    'glibc'                 # C Libraries
    'python'                # Scripting Language
    'python-pip'            # Python Package Manager
    'ripgrep'               # Rust Implementation of Grep
    'fd'                    # Rust Implementation of Find
    'fzf'                   # Command Line Fuzzy-Finder
    'hub'                   # Github CLI
    'emacs'                 # GNU Editor MACroS ( doom emacs distrobution )

    # MEDIA ---------------------------------------------------------------

    'kdenlive'              # Movie Render
    'vlc'                   # Video Player

    # GRAPHICS AND DESIGN -------------------------------------------------

    'inkscape'              # Vector Graphics Manipulation
    'gimp'                  # GNU Image Manipulation Program
    'blender'               # Open Source Modeling and Sculpting Software

    # PRODUCTIVITY --------------------------------------------------------

    'hunspell'              # Spellcheck Libraries
    'hunspell-en'           # English Spellcheck Library
    'xpdf'                  # PDF Viewer
    'libreoffice-fresh'     # Office Alternative

)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo -e "\nDone!\n"
