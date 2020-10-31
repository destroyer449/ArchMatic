#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__|
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo -e "\nProgram configuration"

# Clone dotfiles repo ----------------------------------------------------
git clone https://github.com/destroyer449/dotfiles $HOME/
mv $HOME/dotfiles/.config/* $HOME/.config
rm -rf $HOME/.config/dotfiles

# Editor set up ----------------------------------------------------------
echo -e "what is your prefered editor?"
echo -e "Neovim [0]      Spacemacs [1]      Doom Emacs [2]"
echo -e "Default is to keep all editor config files and install Doom emacs."
read -r editor
if [ $editor == "Neovim"  ] || [ $editor == "0" ]; then
    rm -rf $HOME/.config/doom $HOME/.config/spacemacs
elif [ $editor  ==  "Spacemacs" ] || [ $editor  ==  "1" ]; then
    rm -rf $HOME/.config/doom $HOME/.config/nvim
    git clone https://syl20bnr/spacemacs ~/.config/emacs
    echo "SPACEMACSDIR=$HOME/.config/spacemacs" >> .zshrc
else
    git clone --depth 1 https://github.com/hlissner/doom-emacs $HOME/.config/emacs
    ./$HOME/.config/emacs/bin/doom install
    ./$HOME/.config/emacs/bin/doom sync
fi

# ZSH configuration ------------------------------------------------------
echo "Installing ZSH"
export ZSH=~/.config/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unatended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
p10k configure
chsh /usr/bin/sh

# Dmenu build ------------------------------------------------------------
cd $HOME/.config/dmenu
echo "Sudo permissions required to build Dmenu"
sudo make clean install
