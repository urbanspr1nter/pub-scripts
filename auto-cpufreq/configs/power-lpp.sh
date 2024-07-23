#!/bin/bash

sudo cat /home/rngo/.config/auto-cpufreq/w9-3475x-lpp.conf  | sudo tee /etc/auto-cpufreq.conf &> /dev/null
sudo systemctl restart auto-cpufreq

echo "*** VeryLow-Power Profile Installed! ***"
