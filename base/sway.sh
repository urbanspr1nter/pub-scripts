#!/bin/bash

PWD=$(pwd)

sudo echo "Elevating privileges..."

sudo apt install brightnessctl light sway swaybg swayidle swayimg swaylock waybar wofi fonts-font-awesome -y

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

