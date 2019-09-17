#!/bin/bash
# Cmake building and installing script (ubuntu)

# Uninstall the default version provided by Ubuntu's package manager:
sudo apt remove cmake
sudo apt purge --auto-remove cmake

# [required]
sudo apt-get install -q wget

version=3.15
build=2
cd /tmp
wget https://cmake.org/files/v$version/cmake-$version.$build.tar.gz
sudo mkdir /opt/cmake
sudo tar -xzvf cmake-$version.$build.tar.gz -C /opt/cmake
cd /opt/cmake/cmake-$version.$build/

sudo ./bootstrap
sudo make -j$(lscpu -p | egrep -v '^#' | sort -u -t, -k 2,4 | wc -l)
sudo make install