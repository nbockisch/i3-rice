#!/usr/bin/bash

# Written by Nathan Bockisch
# Installs all my essential software and dot files for my i3 setup
# Written for Arch based systems, tested on Arch and Parabola
# Designed for a fresh install with an internet connection

# All the utility packages needed to run the setup
UTILS="alsa-utils compton dmenu i3-gaps make pulseaudio pulseaudio-alsa ttf-font-awesome ttf-roboto-mono xorg-apps xorg-server xorg-xinit xsetroot"

# Preferred applications that can be found in pacman
APPS="feh surf tabbed vim wget zathura"

# Install everything from pacman
pacman -S $UTILS $APPS

# Clone git repos for applications not in pacman
git clone https://aur.archlinux.org/lemonbar-xft-git.git ~/.lemonbar
git clone https://git.suckless.org/st ~/.st

# Copy dot files
cp dots/st/config.h ~/.st/config.h
cp dots/lemonbar/status.sh ~/.lemonbar/status.sh

mkdir ~/.config/i3
cp dots/config/i3/config ~/.config/i3/config

cp dots/xinitrc ~/.xinitrc
cp dots/bashrc ~/.bashrc
cp dots/vimrc ~/.vimrc

# Build repos form source
make install -C ~/.st/

cd ~/.lemonbar
makepkg -i
