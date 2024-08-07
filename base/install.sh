#!/bin/bash

# Configure XDG_CONFIG_HOME
XDG_CONFIG_HOME=$HOME/.config
mkdir -p $XDG_CONFIG_HOME
echo "export XDG_CONFIG_HOME=$HOME/.config" >> ~/.bashrc

# Make my default 'code' directory
mkdir -p $HOME/code

# elevating permissions
sudo echo "Elevating..."

# install the most essential things
sudo apt install curl vim build-essential git git-email python3-pip gnome-tweaks -y
sudo apt install cscope libncurses-dev libssl-dev libelf-dev bison flex -y
sudo apt install libglfw3-dev libcapstone-dev -y

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
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim -y

mkdir -p $XDG_CONFIG_HOME/nvim

# clone my neovim config
git clone https://github.com/urbanspr1nter/kickstart.nvim.git $XDG_CONFIG_HOME/nvim

# Add my name as default for git commits
git config --global user.name "Roger Ngo"

# always need flatpak
# sudo apt install flatpak -y
# sudo apt install gnome-software-plugin-flatpak -y
# flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo


if [ ! -f /etc/udev/rules.d/80-l1-kvm-audio.rules ]; then
    # create a known udev rule to address my KVM audio issues. see 80-l1-kvm-audio.rules for more info, but
    # this is just an inline version of that.
    sudo echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="0d8c", ATTRS{idProduct}=="0016", ATTR{authorized}="0"' | sudo tee /etc/udev/rules.d/80-l1-kvm-audio.rules
fi 

# Install docker if this system already does not have it
if [ ! -f /usr/bin/docker ]; then
    # setup the docker repos
    sudo apt update
    sudo apt install ca-certificates curl -y
    sudo install -m 0755 -d /etc/apt/keyrings -y
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null;

    sudo apt update


    sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

    # make non-root docker usage possible
    sudo usermod -aG docker $USER

    # refresh changes
    newgrp docker
fi


# Tmux
if [ ! -f /usr/bin/tmux ]; then
    sudo apt install tmux -y
fi

# tmux plugin manager
mkdir -p $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

mkdir -p $HOME/.config/tmux
# tmux catppuccin theme
echo "set -g @plugin 'catppuccin/tmux'" >> $HOME/.config/tmux/tmux.conf

# tmux plugin manager configuration 
echo "set -g @plugin 'tmux-plugins/tpm'" >> $HOME/.config/tmux/tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-sensible'" >> $HOME/.config/tmux/tmux.conf
echo "run '$HOME/.tmux/plugins/tpm/tpm'" >> $HOME/.config/tmux/tmux.conf

# create a symbolic link
ln -s $HOME/.config/tmux/tmux.conf $HOME/.tmux.conf


echo "You should reboot now."
