#!/bin/bash

sudo cat $XDG_CONFIG_HOME/auto-cpufreq/w9-3475x-lp.conf | sudo tee /etc/auto-cpufreq.conf &> /dev/null
sudo systemctl restart auto-cpufreq

echo "*** Low-Power Profile Installed! ***"
