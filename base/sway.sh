#!/bin/bash

PWD=$(pwd)

sudo echo "Elevating privileges..."

sudo apt install brightnessctl light sway swaybg swayidle swayimg swaylock waybar wofi fonts-font-awesome -y

# add the current user to video group so that brightnessctl can work without sudo
sudo usermod -aG video $USER
newgrp video

mkdir -p $HOME/.config/sway $HOME/.config/waybar $HOME/.config/wofi

# copy sway config
cp -r $PWD/config/sway/* $HOME/.config/sway

# copy waybar config
cp -r $PWD/config/waybar/* $HOME/.config/waybar

# copy wofi config
cp -r $PWD/config/wofi/* $HOME/.config/wofi

# install ulauncher
sudo add-apt-repository universe -y
sudo add-apt-repository ppa:agornostal/ulauncher -y 
sudo apt update
sudo apt install ulauncher -y

# setup the catppuccin ulauncher theme
python3 <(curl https://raw.githubusercontent.com/catppuccin/ulauncher/main/install.py -fsSL)

# set up the wallpaper
mkdir -p $HOME/Pictures/Wallpaper
cp $PWD/wallpapers/catppuccin.jpg $HOME/Pictures/Wallpaper

