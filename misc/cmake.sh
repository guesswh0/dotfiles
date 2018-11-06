#!/bin/bash

version=3.12
build=3
mkdir ~/temp
cd ~/temp
wget https://cmake.org/files/v$version/cmake-$version.$build-Linux-x86_64.sh 
sudo mkdir /opt/cmake
sudo sh cmake-$version.$build-Linux-x86_64.sh --prefix=/opt/cmake
sudo ln -s /opt/cmake/cmake-$version.$build-Linux-x86_64/bin/cmake /usr/local/bin/cmake