#!/bin/bash

mkdir -p ~/code/tools/auto-cpufreq-scripts

cp ./power-lp.sh ~/code/tools/auto-cpufreq-scripts/power-lp
chmod +x ~/code/tools/auto-cpufreq-scripts/power-lp
echo "alias power-lp=\"sudo ~/code/tools/auto-cpufreq-scripts/power-lp\"" >> ~/.bashrc

cp ./power-perf.sh ~/code/tools/auto-cpufreq-scripts/power-perf
chmod +x ~/code/tools/auto-cpufreq-scripts/power-perf
echo "alias power-perf=\"sudo ~/code/tools/auto-cpufreq-scripts/power-perf\"" >> ~/.bashrc

sudo mkdir -p /etc/auto-cpufreq.d
sudo cp ./*.conf /etc/auto-cpufreq.d/
 
sudo auto-cpufreq --install

echo "Installed profiles for auto-cpufreq. Use power-lp or power-perf profiles to switch. Run source ~/.bashrc to refresh the terminal."
