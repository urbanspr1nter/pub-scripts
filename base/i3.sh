#!/bin/bash

sudo apt install i3 -y

mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/i3status

cp $PWD/config/i3/config $HOME/.config/i3
cp $PWD/config/i3/catppuccin-mocha $HOME/.config/i3

cp $PWD/config/i3status/config $HOME/.config/i3status

# set up the wallpaper
mkdir -p $HOME/Pictures/Wallpaper
cp $PWD/wallpapers/catppuccin.jpg $HOME/Pictures/Wallpaper