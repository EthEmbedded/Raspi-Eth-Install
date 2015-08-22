#!/bin/bash

#First we need to perform some housekeeping & install dependencies
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install raspi-copies-and-fills build-essential git python curl scons cmake libboost-all-dev automake unzip libgmp-dev libgmp3-dev libtool libleveldb-dev yasm libminiupnpc-dev libreadline-dev libncurses5-dev libcurl4-openssl-dev wget libjsoncpp-dev libargtable2-dev libmicrohttpd-dev

#We must compile cryptopp & json-rpc-cpp from source "the old way" for armhf

#Cryptopp
git clone https://github.com/mmoss/cryptopp.git
cd cryptopp
sudo scons --shared --prefix=/usr
cd ..

#Json-rpc-cpp	
git clone git://github.com/cinemast/libjson-rpc-cpp.git
mkdir -p libjson-rpc-cpp/build
cd libjson-rpc-cpp/build
sudo cmake .. 
sudo make
sudo make install
sudo ldconfig	
cd ../..

#Now lets install Ethereum 
#If this is your first time playing around with Ethereum, I would suggest starting with `geth`
cd ~
git clone https://github.com/ethereum/cpp-ethereum
cd cpp-ethereum
git checkout develop
mkdir build
cd build
sudo cmake .. -DCMAKE_BUILD_TYPE=Release -DBUNDLE=minimal
sudo make -j2
cd ../..

