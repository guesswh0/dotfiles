#!/bin/bash
# Cmake installation script, using binary files (ubuntu)
# To remove 
# source cmake.sh remove 

if [[ $1 == remove ]]; then
    sudo rm -rf /opt/cmake
    sudo rm /usr/local/bin/cmake
    return
fi 

sudo apt-get purge -y cmake

# [required]
sudo apt-get install -q wget

version=3.13
build=0
mkdir ~/temp
cd ~/temp
wget https://cmake.org/files/v$version/cmake-$version.$build-Linux-x86_64.sh 
sudo mkdir /opt/cmake
sudo sh cmake-$version.$build-Linux-x86_64.sh --prefix=/opt/cmake
sudo ln -s /opt/cmake/cmake-$version.$build-Linux-x86_64/bin/cmake /usr/local/bin/cmake

cd ~/ && rm -rf temp