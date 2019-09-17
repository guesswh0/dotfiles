#!/bin/bash
# OpenCV installation script (ubuntu).

# Cmake
if ! [[ -x "$(command -v cmake)" ]]; then
    printf "Install cmake! source .dotfiles/ubuntu/cmake.sh"
    return
fi

opencv_version=3.4.7

# system python and numpy
#sudo apt-get install python3-dev python3-pip python3-numpy

# pyenv
python_version=3.6.9
pyenv install $python_version
pyenv shell $python_version

# numpy 
pip3 install numpy~=1.16.4 

# [compiler]
sudo apt-get install build-essential

# [required] Dependencies 
sudo apt-get install git libgtk2.0-dev pkg-config

# [optional] Libraries used for image and video I/O operations
sudo apt-get install libjpeg-dev libpng-dev libtiff-dev
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install libxvidcore-dev libx264-dev

# [optional] Optimization libraries
sudo apt-get install libatlas-base-dev gfortran
sudo apt-get install libtbb2 libtbb-dev  libjasper-dev libdc1394-22-dev

mkdir -p /opt/opencv-$opencv_version && cd /opt/opencv-$opencv_version

wget -O opencv.zip https://github.com/opencv/opencv/archive/$opencv_version.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/$opencv_version.zip

unzip opencv.zip && mv opencv-$opencv_version opencv
unzip opencv_contrib.zip && mv opencv_contrib-$opencv_version opencv_contrib

cd opencv && mkdir build && cd build

PREFIX=`pyenv prefix`
sudo cmake -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DPYTHON3_LIBRARY=`python3 -c 'import subprocess ; import sys ; s = subprocess.check_output("python3-config --configdir", shell=True).decode("utf-8").strip() ; (M, m) = sys.version_info[:2] ; print("{}/libpython{}.{}m.a".format(s, M, m))'` \
    -DPYTHON3_INCLUDE_DIR=`python3 -c 'import distutils.sysconfig as s; print(s.get_python_inc())'` \
    -DPYTHON3_EXECUTABLE=$PREFIX/bin/python3 \
    -DWITH_TBB=ON \
    -DWITH_V4L=ON \
    -DBUILD_opencv_python2=OFF \
    -DBUILD_opencv_python3=ON ..

# to build with contrib add
# OPENCV_EXTRA_MODULES_PATH=/opt/opencv-$opencv_version/opencv_contrib/modules

sudo make -j$(lscpu -p | egrep -v '^#' | sort -u -t, -k 2,4 | wc -l)
sudo make install