#!/bin/bash

#First we need to perform some housekeeping & install dependencies
echo -e $COL_BLUE"First we need to perform some housekeeping & install dependencies"
echo -e $COL_GREEN"Performing Housekeeping - Update"
sudo apt-get -y update
echo -e $COL_GREEN"Performing Housekeeping - Upgrade"
sudo apt-get -y upgrade
echo -e $COL_GREEN"Installing Dependencies"
sudo apt-get -y install raspi-copies-and-fills build-essential libgmp3-dev git nodejs npm ntp cloud-utils 

#Install GO 1.4.2

#Set environment variables:

cd ~
sudo export PATH=$HOME/golang/bin:$PATH
sudo export GOPATH=$HOME/go
sudo mkdir -p $GOPATH

#Install golang from source:

cd ~
git clone https://go.googlesource.com/go golang
sudo cd golang && git checkout go1.4.2
sudo cd src && ./make.bash

#Install go-ethereum OR `geth`
cd ~
git clone https://github.com/ethereum/go-ethereum
cd go-ethereum
sudo make geth

