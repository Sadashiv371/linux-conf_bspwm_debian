#!/bin/bash

# Function to detect the Linux distribution
detect_linux_distribution() {
    if [ -f /etc/debian_version ]; then
        echo "debian"
    elif [ -f /etc/arch-release ]; then
        echo "arch"
    elif [ -f /etc/fedora-release ]; then
        echo "fedora"
    else
        echo "Unsupported distribution"
        exit 1
    fi
}

# Detect Linux distribution
DISTRO=$(detect_linux_distribution)

# Install necessary packages based on distribution
case $DISTRO in
    "debian")
        sudo apt update
        sudo apt install -y bspwm sxhkd polybar picom dmenu dunst nitrogen ranger alacritty
        ;;
    "arch")
        sudo pacman -Syu --noconfirm bspwm sxhkd polybar picom dmenu dunst nitrogen ranger alacritty
        ;;
    "fedora")
        sudo dnf update -y
        sudo dnf install -y bspwm sxhkd polybar picom dmenu dunst nitrogen ranger alacritty
        ;;
    *)
        echo "Unsupported distribution"
        exit 1
        ;;
esac

# Navigate to the ~/.config directory
cd ~/.config

# Create directories for configuration files
mkdir -p bspwm sxhkd polybar picom dunst

# Copy configuration files to their respective directories
sudo cp /usr/share/doc/bspwm/examples/bspwmrc bspwm/
sudo cp /usr/share/doc/bspwm/examples/sxhkdrc sxhkd/
sudo cp /etc/xdg/picom.conf picom/
sudo cp /etc/polybar/config.ini polybar/
sudo cp /etc/dunst/dunstrc dunst/

# Navigate to the bspwm directory
cd bspwm/

# Make bspwmrc executable
chmod +x bspwmrc

echo "Setup complete. You may need to restart your session or login to BSPWM."

# sudo systemctl restart lightdm

