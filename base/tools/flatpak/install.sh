#!/bin/bash

sudo apt install flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.github.tchx84.Flatseal -y
flatpak install flathub org.flameshot.Flameshot -y
flatpak install flathub org.mozilla.Thunderbird -y
flatpak install flathub fr.handbrake.ghb -y
flatpak install flathub org.gimp.GIMP -y
flatpak install flathub org.kde.kdenlive -y