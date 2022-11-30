#!/bin/bash

#tor install
A=$(cat /etc/lsb-release | grep CODENAME | cut -d'=' -f 2)
apt install apt-transport-https
touch /etc/apt/sources.list.d/tor.list
echo "deb     [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org $A main" >> /etc/apt/sources.list.d/tor.list
echo "deb-src [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org $A main" >> /etc/apt/sources.list.d/tor.list
wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor | tee /usr/share/keyrings/tor-archive-keyring.gpg >/dev/null
apt update
apt install tor deb.torproject.org-keyring
systemctl stop tor.service
systemctl mask tor.service

#tgen install
# sudo apt install cmake libglib2.0-dev libigraph0-dev make
# cd ~
# sudo git clone https://github.com/shadow/tgen.git
# cd tgen/
# mkdir build
# cd build/
# cmake ..
# make

