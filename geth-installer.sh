#!/bin/bash

#First we need to perform some housekeeping & install dependencies
echo -e "\e[32mFirst we need to perform some housekeeping & install dependencies\e[0m"
echo -e "\e[34mPerforming Housekeeping - Update...\e[0m"
sudo apt-get -y update
echo -e "\e[34mPerforming Housekeeping - Upgrade...\e[0m"
sudo apt-get -y upgrade
echo -e "\e[34mInstalling Dependencies...\e[0m"
sudo apt-get -y install raspi-copies-and-fills build-essential libgmp3-dev git

#Install GO 1.4.2
echo -e "\e[34mInstalling GO 1.4.2 from source...\e[0m"

#Set environment variables:

cd ~
sudo export PATH=$HOME/golang/bin:$PATH
sudo export GOPATH=$HOME/go
mkdir -p $GOPATH

#Install golang from source:

cd ~
git clone https://go.googlesource.com/go golang
cd golang
git checkout go1.4.2
cd src
sudo ./make.bash

#Install go-ethereum OR `geth`
echo "Installing go-ethereum..."
cd ~
git clone https://github.com/ethereum/go-ethereum
cd go-ethereum
sudo make geth

