#!/bin/bash
# Cmake building and installing script (ubuntu)

# Uninstall the default version provided by Ubuntu's package manager:
sudo apt remove cmake
sudo apt purge --auto-remove cmake

# [required]
sudo apt-get install -q wget

version=3.13
build=0
mkdir ~/temp
cd ~/temp
wget https://cmake.org/files/v$version/cmake-$version.$build.tar.gz
mkdir ~/cmake
sudo tar -xzvf cmake-$version.$build.tar.gz -C ~/cmake
cd ~/cmake/cmake-$version.$build/

./bootstrap
make -j$(lscpu -p | egrep -v '^#' | sort -u -t, -k 2,4 | wc -l)
sudo make install