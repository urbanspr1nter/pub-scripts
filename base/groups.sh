# make non-root docker usage possible
sudo usermod -aG docker rngo
newgrp docker

# so we can use brightnessctl without sudo
sudo usermod -aG video rngo
newgrp video

