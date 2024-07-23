#!/bin/bash

# Create the necessary directories
mkdir -p $XDG_CONFIG_HOME/auto-cpufreq
mkdir -p ~/code/tools/auto-cpufreq-scripts

cp ./power-lp.sh ~/code/tools/auto-cpufreq-scripts/power-lp
chmod +x ~/code/tools/auto-cpufreq-scripts/power-lp
echo "alias power-lp=\"~/code/tools/auto-cpufreq-scripts/power-lp\"" >> ~/.bashrc

cp ./power-lpp.sh ~/code/tools/auto-cpufreq-scripts/power-lpp
chmod +x ~/code/tools/auto-cpufreq-scripts/power-lpp
echo "alias power-lpp=\"~/code/tools/auto-cpufreq-scripts/power-lpp\"" >> ~/.bashrc

cp ./power-perf.sh ~/code/tools/auto-cpufreq-scripts/power-perf
chmod +x ~/code/tools/auto-cpufreq-scripts/power-perf
echo "alias power-perf=\"~/code/tools/auto-cpufreq-scripts/power-perf\"" >> ~/.bashrc

cp ./*.conf $XDG_CONFIG_HOME/auto-cpufreq
cp ./w9-3475x-lp.conf $XDG_CONFIG_HOME/auto-cpufreq/auto-cpufreq.conf
 
sudo auto-cpufreq --install

echo "Installed profiles for auto-cpufreq. Use power-lp or power-perf profiles to switch. Run source ~/.bashrc to refresh the terminal."
