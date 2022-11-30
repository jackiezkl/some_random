#!/bin/bash

#tor install
A=$(cat /etc/lsb-release | grep CODENAME | cut -d'=' -f 2)
sudo apt install apt-transport-https
sudo touch /etc/apt/sources.list.d/tor.list
sudo echo "deb     [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org $A main" >> /etc/apt/sources.list.d/tor.list
sudo  "deb-src [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org $A main" >> /etc/apt/sources.list.d/tor.list
wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor | tee /usr/share/keyrings/tor-archive-keyring.gpg >/dev/null
sudo apt update
sudo apt install tor deb.torproject.org-keyring

#tgen install
sudo systemctl stop tor.service
sudo systemctl mask tor.service
#sudo apt install cmake libglib2.0-dev libigraph0-dev make
cd ~
#sudo git clone https://github.com/shadow/tgen.git
#cd tgen/
#mkdir build
#cd build/
#cmake ..
#make

