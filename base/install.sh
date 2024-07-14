#!/bin/bash

mkdir -p $HOME/code

# install the most essential things
sudo apt install curl vim build-essential git git-email python3-pip gnome-tweaks -y
sudo apt install cscope libncurses-dev libssl-dev libelf-dev bison flex -y

# always need flatpak
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# neovim!
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim -y

mkdir -p $HOME/.config/nvim

# clone my neovim config
git clone https://github.com/urbanspr1nter/kickstart.nvim.git $HOME/.config/nvim


