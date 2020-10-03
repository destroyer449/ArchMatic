#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__|
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo -e "\nINSTALLING AUR SOFTWARE\n"

cd "${HOME}"

echo "CLOING: YAY"
git clone "https://aur.archlinux.org/yay.git"


PKGS=(

    # UTILITIES -----------------------------------------------------------

    'i3lock-fancy'              # Screen locker
    'fzf'                       # Command Line Fuzzy-Finder
    'dust-bin'                  # Rust Implementation of Disk Used
    'dxvk-bin'                  # DirectX To Vulkan Layer
    'universal-ctags-git'       # Improved CTags Implementation
    'anaconda'                  # Python Env Management
    'autojump'                  # File Navigation

    # COMMUNICATIONS ------------------------------------------------------

    'brave-bin'                 # Brave


    # THEMES --------------------------------------------------------------

    'materia-gtk-theme'             # Desktop Theme
    'tela-icon-theme-git'           # Desktop Icons
    'xcursor-oxygen'                # Cursor Themes
    'nerd-fonts-complete'           # Nerd Fonts
)


cd ${HOME}/yay
makepkg -si

for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done

echo -e "\nDone!\n"
