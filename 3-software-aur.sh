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

    'dust-bin'                  # Rust Implementation of Disk Used
    'dxvk-bin'                  # DirectX To Vulkan Layer
    'mu-git'                    # Mu email indexer and Mu4e client
    'picom-jonaburg-git'        # Better Verison of Picom With Animations
    'font-preview'              # Small BASH Script To View Fonts
    'redshift-gtk-git'          # Tints Screen Red At Night

    # DEVELOPMENT ---------------------------------------------------------

    'neovim-git'                    # NeoViM 0.5 With LSP
    'emacs-native-comp-git'         # GCCEMACS
    'autojump'                      # File Navigation
    'haskell-language-server-bin'   # Haskell Language Server

    # THEMES --------------------------------------------------------------

    'lightdm-slick-greeter'         # Login Screen Theme
    'orchis-theme-git'              # Desktop Theme
    'tela-icon-theme-git'           # Desktop Icons
    'xcursor-oxygen'                # Cursor Themes
    'nerd-fonts-jetbrains-mono'     # Nerd Fonts
    'nerd-fonts-meslo'              # Nerd Fonts
    'nerd-fonts-hack'               # Nerd Fonts
    'nerd-fonts-dejavu-complete'    # Nerd Fonts
)


cd ${HOME}/yay
makepkg -si

for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done

echo -e "\nDone!\n"
