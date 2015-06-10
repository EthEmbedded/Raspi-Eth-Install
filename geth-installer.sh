#!/bin/bash

#First we need to perform some housekeeping & install dependencies
sudo apt-get -y update
sudo apt-get -y upgrade
sudo dpkg-reconfigure locales
sudo apt-get -y install raspi-copies-and-fills build-essential git nodejs npm ntp cloud-utils 

#Install GO 1.4.2

#Set environment variables:

export PATH=$HOME/golang/bin:$PATH
export GOPATH=$HOME/go
mkdir -p $GOPATH

#Install golang from source:

cd ~
git clone https://go.googlesource.com/go golang
cd golang && git checkout go1.4.2
cd src && ./make.bash

#Install go-ethereum OR `geth`
git clone https://github.com/ethereum/go-ethereum
cd go-ethereum
make geth

#Finally we can run `geth` by going to the proper directory and executign the `./geth` command:
cd ~/go-ethereum/build/bin/
./geth
