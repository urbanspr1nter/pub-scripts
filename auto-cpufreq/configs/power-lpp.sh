#!/bin/bash

sudo cat /etc/auto-cpufreq.d/w9-3475x-lpp.conf | sudo tee /etc/auto-cpufreq.conf &> /dev/null
sudo systemctl restart auto-cpufreq

echo "*** VeryLow-Power Profile Installed! ***"
