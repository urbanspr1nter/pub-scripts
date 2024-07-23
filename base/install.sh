#!/bin/bash

echo "export XDG_CONFIG_HOME=\$HOME/.config" >> ~/.bashrc

mkdir -p $HOME/code

# elevating permissions
sudo echo "Elevating..."

# install the most essential things
sudo apt install curl vim build-essential git git-email python3-pip gnome-tweaks -y
sudo apt install cscope libncurses-dev libssl-dev libelf-dev bison flex -y

# increase file limits
echo "Updating /etc/security/limits.conf ..."
sudo echo "*    soft nofile 1000000" | sudo tee -a /etc/security/limits.conf
sudo echo "*    hard nofile 1000000" | sudo tee -a /etc/security/limits.conf
sudo echo "$USER soft nofile 1000000" | sudo tee -a /etc/security/limits.conf
sudo echo "$USER hard nofile 1000000" | sudo tee -a /etc/security/limits.conf
sudo echo "root soft nofile 1000000" | sudo tee -a /etc/security/limits.conf
sudo echo "root hard nofile 1000000" | sudo tee -a /etc/security/limits.conf

echo "Updating /etc/sysctl.d/60-file-max.conf"
sudo echo "fs.file-max=1000000" | sudo tee /etc/sysctl.d/60-file-max.conf


echo "Updating /etc/systemd/system.conf"
sudo echo "DefaultLimitNOFILE=1000000" | sudo tee -a /etc/systemd/system.conf

echo "Updating /etc/sysctl.conf"
sudo echo "fs.inotify.max_user_watches=1000000" | sudo tee -a /etc/sysctl.conf
sudo echo "fs.inotify.max_user_instances=1000000" | sudo tee -a /etc/sysctl.conf

sudo sysctl -p

echo "Done."

# ripgrep and xclip
sudo apt install ripgrep xclip -y

# neovim!
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim -y

mkdir -p $HOME/.config/nvim

# clone my neovim config
git clone https://github.com/urbanspr1nter/kickstart.nvim.git $HOME/.config/nvim

# Add my name as default for git commits
git config --global user.name "Roger Ngo"

# always need flatpak
# sudo apt install flatpak -y
# sudo apt install gnome-software-plugin-flatpak -y
# flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# copy udev rules
sudo cp 80-l1-kvm-audio.rules /etc/udev/rules.d

echo "You should reboot now."
