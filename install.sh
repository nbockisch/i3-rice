#!/usr/bin/bash

# Written by Nathan Bockisch
# Installs all my essential software and dot files for my i3 setup
# Written for Arch based systems, tested on Arch and Parabola
# Designed for a fresh install with an internet connection and sudo installed
# Run with sudo as a non-root user

# All the utility packages and dependencies needed to run the setup
UTILS="acpi alsa-utils compton dmenu gcr gst-libav gst-plugins-good gstreamer i3-gaps make pulseaudio pulseaudio-alsa xf86-video-intel xorg-apps xorg-font-utils xorg-server xorg-xinit"

# Preferred applications that can be found in pacman
APPS="feh tabbed vim wget zathura"

# Install everything from pacman
pacman -S $UTILS $APPS

# Clone git repos for applications not in pacman
sudo -u $SUDO_USER git clone https://aur.archlinux.org/lemonbar-xft-git.git /home/$SUDO_USER/.lemonbar
sudo -u $SUDO_USER git clone https://aur.archlinux.org/ttf-roboto-mono.git /home/$SUDO_USER/.roboto-mono
sudo -u $SUDO_USER git clone https://aur.archlinux.org/ttf-font-awesome-4.git /home/$SUDO_USER/.font-awesome
sudo -u $SUDO_USER git clone https://git.suckless.org/st /home/$SUDO_USER/.st
sudo -u $SUDO_USER git clone https://git.suckless.org/surf /home/$SUDO_USER/.surf

# Copy dot files
cp dots/st/config.h /home/$SUDO_USER/.st/config.h
cp dots/lemonbar/status.sh /home/$SUDO_USER/.lemonbar/status.sh

mkdir /home/$SUDO_USER/.config
mkdir /home/$SUDO_USER/.config/i3
cp dots/config/i3/config /home/$SUDO_USER/.config/i3/config

cp dots/xinitrc /home/$SUDO_USER/.xinitrc
cp dots/bashrc /home/$SUDO_USER/.bashrc
cp dots/vimrc /home/$SUDO_USER/.vimrc

# Build repos form source
make install -C /home/$SUDO_USER/.st/
make install -C /home/$SUDO_USER/.surf/

# Build AUR packages
cd /home/$SUDO_USER/.lemonbar
sudo -u $SUDO_USER makepkg -i

cd /home/$SUDO_USER/.roboto-mono 
sudo -u $SUDO_USER makepkg -i

cd /home/$SUDO_USER/.font-awesome
sudo -u $SUDO_USER makepkg -i


