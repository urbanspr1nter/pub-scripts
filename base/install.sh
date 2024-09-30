#!/bin/bash

PWD=$(pwd)

# Configure XDG_CONFIG_HOME
XDG_CONFIG_HOME=$HOME/.config
mkdir -p $XDG_CONFIG_HOME
echo "export XDG_CONFIG_HOME=$HOME/.config" >> ~/.bashrc

# Make my default 'code' directory
mkdir -p $HOME/code

# elevating permissions
sudo echo "Elevating..."

# install the most essential things
sudo apt install curl vim build-essential git git-email python3-pip gnome-tweaks \
    cscope libncurses-dev libssl-dev libelf-dev bison flex \
    libglfw3-dev libcapstone-dev ripgrep xclip \
    feh pavucontrol pasystray brightnessctl -y

sudo usermod -aG video $USER

# Git lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash

# increase http.postBuffer size to 512MB
git config --global http.postBuffer 536870912

# increase file limits
source $PWD/fs-limits.sh

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

if [ ! -f /etc/udev/rules.d/80-l1-kvm-audio.rules ]; then
    # create a known udev rule to address my KVM audio issues. see 80-l1-kvm-audio.rules for more info, but
    # this is just an inline version of that.
    sudo echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="0d8c", ATTRS{idProduct}=="0016", ATTR{authorized}="0"' | sudo tee /etc/udev/rules.d/80-l1-kvm-audio.rules
fi 

# Install Volta, Node and yarn 1.22.22
if [ ! -f $HOME/.volta/bin/volta ]; then
    curl https://get.volta.sh | bash

    $HOME/.volta/bin/volta install node@22.2.0
    $HOME/.volta/bin/volta install yarn@1.22.22
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

    sudo usermod -aG docker $USER
fi

# Tmux
source $PWD/tools/tmux/install.sh
cp $PWD/tools/tmux/tmux.conf $HOME/.config/tmux
ln -s $HOME/.config/tmux/tmux.conf $HOME/.tmux.conf

# Fonts!
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip -O $HOME/CascadiaCode.zip
mkdir -p $HOME/post-install-temp
unzip $HOME/CascadiaCode.zip -d $HOME/post-install-temp

sudo mv $HOME/post-install-temp/*.ttf /usr/share/fonts
sudo fc-cache -f -v

# clean up the font installation files
rm $HOME/CascadiaCode.zip
rm -rf $HOME/post-install-temp

# Gnome Terminal Theme
curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v0.3.0/install.py | python3 -

# install ulauncher
sudo add-apt-repository universe -y
sudo add-apt-repository ppa:agornostal/ulauncher -y 
sudo apt update
sudo apt install ulauncher -y

# setup the catppuccin ulauncher theme
python3 <(curl https://raw.githubusercontent.com/catppuccin/ulauncher/main/install.py -fsSL)

source $PWD/tools/flatpak/install.sh
source $PWD/tools/snap/install.sh
source $PWD/i3.sh

source $PWD/tools/brew/install.sh

# watchman
brew install watchman
cp $PWD/watchmanconfig $HOME/.watchmanconfig

echo "You should reboot now."
