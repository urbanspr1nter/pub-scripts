#!/bin/bash

# Install the latest version of i3
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2024.03.04_all.deb keyring.deb SHA256:f9bb4340b5ce0ded29b7e014ee9ce788006e9bbfe31e96c09b2118ab91fca734
sudo apt install ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update
sudo apt install i3 -y

# Polybar dependencies
sudo apt install clang cmake cmake-data pkg-config python3-sphinx python3-packaging \
    libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev \
    python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev \
    libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev \
    libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev -y

mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/i3status

cp $PWD/config/i3/config $HOME/.config/i3
cp $PWD/config/i3/catppuccin-mocha $HOME/.config/i3

cp $PWD/config/i3status/config $HOME/.config/i3status

# set up the wallpaper
mkdir -p $HOME/Pictures/Wallpaper
cp $PWD/wallpapers/catppuccin.jpg $HOME/Pictures/Wallpaper

# Setup Xresources
cp $PWD/Xresources $HOME/.Xresources