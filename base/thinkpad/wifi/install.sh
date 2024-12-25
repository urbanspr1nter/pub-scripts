git clone https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware $HOME/.bin/qcomm_wifi
cd $HOME/.bin/qcomm_wifi/ath12k-firmware
wget https://github.com/qca/qca-swiss-army-knife/raw/master/tools/scripts/ath12k/ath12k-fw-repo
chmod +x ./ath12k-fw-repo
sudo ./ath12k-fw-repo --install /lib/firmware
