#!/bin/bash

PWD=$(pwd)

sudo apt install tmux -y

# tmux plugin manager
mkdir -p $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm


mkdir -p $HOME/.config/tmux
