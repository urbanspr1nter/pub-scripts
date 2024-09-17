#!/bin/bash

PWD=$(pwd)

sudo echo "Elevating privileges..."

sudo apt install brightnessctl light sway swaybg swayidle swayimg swaylock waybar wofi fonts-font-awesome -y

# For screenshotting
sudo apt install jq grim slurp wl-clipboard imagemagick

mkdir -p $HOME/.config/sway $HOME/.config/waybar $HOME/.config/wofi

# copy sway config
cp -r $PWD/config/sway/* $HOME/.config/sway

# copy waybar config
cp -r $PWD/config/waybar/* $HOME/.config/waybar

# copy wofi config
cp -r $PWD/config/wofi/* $HOME/.config/wofi

# set up the wallpaper
mkdir -p $HOME/Pictures/Wallpaper
cp $PWD/wallpapers/catppuccin.jpg $HOME/Pictures/Wallpaper

# setup sway-screenshot
mkdir -p $HOME/.local/bin
git clone https://github.com/Gustash/sway-screenshot.git $HOME/.local/bin
echo "export PATH=\"$PATH:/home/rngo/.local/bin/sway-screenshot\" >> $HOME/.bashrc
