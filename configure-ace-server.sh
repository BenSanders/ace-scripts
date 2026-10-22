#!/bin/bash
#
# This script is intended to configure a basic private ACE (Asheron's Call) server
# Adapted from https://github.com/ACEmulator/ACE/wiki/ACE-Hosting-Docker
#
# Run this after installing Docker and Docker Compose on your system
#
# Ensure some needed packages are installed
sudo apt install unzip curl
# Download docker-compose.yml
curl -JO https://raw.githubusercontent.com/ACEmulator/ACE/refs/heads/master/docker-compose.yml

# Download docker.env
# Make sure you change both mysql passwords in docker.env
curl -JO https://raw.githubusercontent.com/ACEmulator/ACE/refs/heads/master/docker.env

# Download ac-updates.zip, you can replace with another version if you want
curl -JO "https://drive.anfg.net/public.php/dav/files/AYEETFpMBZ2Qf58/?accept=zip"

# Create and cd into Dats directory
mkdir -p Dats && cd /Dats

# Unzip ac-updates.zip to /Dats
unzip ac-updates.zip -d /Dats