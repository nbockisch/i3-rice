#!/usr/bin/bash

# Written by Nathan Bockisch
# Installs all my essential software and dot files for my i3 setup
# Written for Arch based systems, tested on Arch and Parabola
# Designed for a fresh install with an internet connection and sudo installed
# Run with sudo as a non-root user

# All the utility packages and dependencies needed to run the setup
UTILS="alsa-utils compton dmenu i3-gaps make pulseaudio pulseaudio-alsa ttf-font-awesome xorg-apps xorg-font-utils xorg-server xorg-xinit"

# Preferred applications that can be found in pacman
APPS="feh surf tabbed vim wget zathura"

# Install everything from pacman
pacman -S $UTILS $APPS

# Clone git repos for applications not in pacman
git clone https://aur.archlinux.org/lemonbar-xft-git.git /home/$USER/.lemonbar
git clone https://aur.archlinux.org/ttf-roboto-mono.git /home/$USER/.roboto-mono
git clone https://git.suckless.org/st /home/$USER/.st

# Copy dot files
cp dots/st/config.h /home/$USER/.st/config.h
cp dots/lemonbar/status.sh /home/$USER/.lemonbar/status.sh

mkdir /home/$USER/.config
mkdir /home/$USER/.config/i3
cp dots/config/i3/config /home/$USER/.config/i3/config

cp dots/xinitrc /home/$USER/.xinitrc
cp dots/bashrc /home/$USER/.bashrc
cp dots/vimrc /home/$USER/.vimrc

# Build repos form source
make install -C /home/$USER/.st/

# Build AUR packages
cd /home/$USER/.lemonbar
sudo -u $USER makepkg -i

cd /home/$USER/.roboto-mono 
sudo -u $USER makepkg -i
