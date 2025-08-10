#!/bin/bash

# INSTALL.sh - Script to install the application

sudo pacman -S --noconfirm --needed \
    base-devel \
    git \
    cmake \
    stow \
    kitty \
    neovim \
    ttf-jetbrains-mono \
    starship \
    hyprland \
    nwg-look
if [ $? -ne 0 ]; then
    echo "Error: Failed to install required packages."
    exit 1
fi 
echo "Required packages installed successfully."

# Clone the repository
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
if [ $? -ne 0 ]; then
    echo "Error: Failed to install yay."
    exit 1
fi
echo "yay installed successfully."

# Install additional AUR packages
yay -S nerdfetch \
       hyprlock \
       hyprpaper \
       hyprpicker \
       hyprshot \ 
if [ $? -ne 0 ]; then
    echo "Error: Failed to install nerdfetch."
    exit 1
fi
echo "nerdfetch installed successfully."
