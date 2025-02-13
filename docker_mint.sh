#!/bin/bash

# Linux Mint 22.1 Cinnamon

sudo apt update && sudo apt upgrade -y

sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/trusted.gpg.d/docker.asc > /dev/null

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

sudo apt update && sudo apt upgrade -y

sudo apt install -y docker-ce

sudo systemctl status docker --no-pager

docker --version

sudo systemctl enable docker

sudo usermod -aG docker $(whoami)
newgrp docker

echo "Docker Instalado com Sucesso!"
