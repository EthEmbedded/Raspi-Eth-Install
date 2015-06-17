#!/bin/bash

#First we need to perform some housekeeping & install dependencies
echo "First we need to perform some housekeeping & install dependencies"
echo "Performing Housekeeping - Update..."
sudo apt-get -y update
echo "Performing Housekeeping - Upgrade..."
sudo apt-get -y upgrade
echo "Installing Dependencies..."
sudo apt-get -y install raspi-copies-and-fills build-essential libgmp3-dev git

#Install GO 1.4.2
echo "Installing GO 1.4.2 from source..."

#Set environment variables:

cd ~
sudo export PATH=$HOME/golang/bin:$PATH
sudo export GOPATH=$HOME/go
sudo mkdir -p $GOPATH

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

