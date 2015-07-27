#!/bin/bash

#Upgrade Debian to "stretch"
echo -e "\e[32mFirst we need to edit our sources.list to set stretch/testing as our source so we can install latest versions of dependencies\e[0m"
sudo sed -i /deb/s/wheezy/stretch/g /etc/apt/sources.list
sudo sed -i /deb/s/jessie/stretch/g /etc/apt/sources.list
echo -e "\e[34mPerforming Housekeeping - Update...\e[0m"
sudo apt-get -y update
echo -e "\e[34mPerforming Housekeeping - Upgrade...\e[0m"
sudo apt-get -y upgrade
echo -e "\e[34mPerforming Debian Upgrade from `Jessie` to `Stretch`...\e[0m"
sudo apt-get -y dist-upgrade 

#Install dependencies
echo -e "\e[34mInstalling Dependencies...\e[0m"
sudo apt-get -y install dphys-swapfile build-essential libgmp3-dev golang git raspi-copies-and-fills

#Install go-ethereum OR `geth`
echo -e "\e[34mInstalling go-ethereum...\e[0m"
cd ~
git clone https://github.com/ethereum/go-ethereum
cd go-ethereum
make geth
