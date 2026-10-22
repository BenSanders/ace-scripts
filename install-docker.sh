#!/bin/bash
#
#This script is adapted from Vultr's documentation: https://docs.vultr.com/how-to-install-docker-on-ubuntu-26-04
#
# Created on Ubuntu Version: "24.04.5 LTS (Noble Numbat)"
# Last Tested on Ubuntu Version: "24.04.5 LTS (Noble Numbat)"
# Install dependency package
sudo apt install apt-transport-https ca-certificates curl -y

# Add the docker GPG key to the server's keyring
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

# Add the Docker repo to the APT sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the APT package index to include the new repo
sudo apt update

# Install the Docker engine and its plugins
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Confirm the installed Docker version
docker --version

# Enable Docker start automatically at boot time
sudo systemctl enable docker

# Verify that Docker is active and running
# sudo systemctl status docker

# Add User to the Docker Group
sudo usermod -aG docker $USER

# Apply group membership changes
newgrp docker

# Verify Docker commands work without sudo
docker ps

# Install Docker Compose
sudo apt install docker-compose-plugin -y

# Ensure Docker Compose is installed
docker compose version