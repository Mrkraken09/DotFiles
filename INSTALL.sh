#!/bin/bash
set -euo pipefail

# Prevent running as root
if [ "$EUID" -eq 0 ]; then
    echo "Error: Do not run this script as root/sudo. Run it as your normal user."
    exit 1
fi

echo "==> Installing official packages..."
sudo pacman -S --needed --noconfirm \
    base-devel \
    git \
    cmake \
    stow \
    kitty \
    neovim \
    ttf-jetbrains-mono \
    ttf-firacode \
    starship \
    hyprland \
    hyprlock \
    hyprpaper \
    hyprpicker \
    hypridle \
    nwg-look \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal \
    xdg-user-dirs

# Install paru if not already present
if ! command -v paru &> /dev/null; then
    echo "==> paru not found. Installing paru from AUR..."
    BUILD_DIR=$(mktemp -d)
    git clone https://aur.archlinux.org/paru.git "$BUILD_DIR/paru"
    (cd "$BUILD_DIR/paru" && makepkg -si --noconfirm)
    rm -rf "$BUILD_DIR"
    echo "==> paru installed successfully."
else
    echo "==> paru is already installed, skipping build."
fi

# Install AUR packages
echo "==> Installing AUR packages..."
paru -S --needed --noconfirm \
    nerdfetch \
    hyprshot

echo "==> All packages installed successfully!"
