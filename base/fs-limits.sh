#!/bin/bash

sudo echo "Elevating..."

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
