#!/bin/bash

#First we need to perform some housekeeping & install dependencies
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install raspi-copies-and-fills build-essential git python curl scons cmake libboost-all-dev automake unzip libgmp-dev libgmp3-dev libtool libleveldb-dev yasm libminiupnpc-dev libreadline-dev libncurses5-dev libcurl4-openssl-dev wget libjsoncpp-dev libargtable2-dev libmicrohttpd-dev libedit-dev mesa-common-dev ocl-icd-libopencl1 opencl-headers libgoogle-perftools-dev ocl-icd-dev libv8-dev

#Download armhf pre-compiled llvm-3.8 
cd ~
wget http://www.ethembedded.com/downloads/llvm-38-deb-files/llvm_deb_files.zip
unzip llvm_deb_files.zip
cd llvm_deb_files
sudo dpkg -i *.deb
cd ..

#We must compile cryptopp & json-rpc-cpp from source for armhf

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
cd ~
git clone https://github.com/ethereum/cpp-ethereum
cd cpp-ethereum
git checkout develop
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DBUNDLE=minimal -DEVMJIT=off
make -j2
cd ../..

