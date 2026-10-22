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

read -s -p "Please specify the MYSQL_ROOT_PASSWORD: " MYSQL_ROOT_PASSWORD
echo ""

if test "$MYSQL_ROOT_PASSWORD" = ""; then
        echo "$0: sorry, password cannot be blank" >&2
        exit 1;
fi

sed -i -e"s/^MYSQL_ROOT_PASSWORD=.*/MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD/" docker.env

if test $? -eq 0; then
        echo 'MYSQL_ROOT_PASSWORD password set' >&2
else
        echo 'MYSQL_ROOT_PASSWORD set attempt failed' >&2
        exit 1
fi

echo "done" >&2

read -s -p "Please specify the non-root MYSQL_PASSWORD: " MYSQL_PASSWORD
echo ""

if test "$MYSQL_PASSWORD" = ""; then
        echo "$0: sorry, password cannot be blank" >&2
        exit 1;
fi

sed -i -e"s/^MYSQL_PASSWORD=.*/MYSQL_PASSWORD=$MYSQL_PASSWORD/" docker.env

if test $? -eq 0; then
        echo 'MYSQL_PASSWORD password set' >&2
else
        echo 'MYSQL_PASSWORD set attempt failed' >&2
        exit 1
fi

echo "done" >&2

# Download ac-updates.zip, you can replace with another version if you want
curl -JO "https://drive.anfg.net/public.php/dav/files/AYEETFpMBZ2Qf58/?accept=zip"

# Create and cd into Dats directory
mkdir -p Dats && cd /Dats

# Unzip ac-updates.zip to /Dats
unzip ac-updates.zip -d /Dats