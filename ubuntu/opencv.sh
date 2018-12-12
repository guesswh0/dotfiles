#!/bin/bash
# OpenCV installation script (ubuntu).

# Cmake
if ! [[ -x "$(command -v cmake)" ]]; then
    printf "Install cmake! source .dotfiles/ubuntu/cmake.sh"
    return
fi

opencv_version=3.4.4

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

# Python3
sudo apt-get install python3-dev python3-pip python3-numpy

mkdir ~/opencv-$opencv_version/ && cd ~/opencv-$opencv_version

git clone https://github.com/opencv/opencv_contrib.git && cd opencv_contrib
git checkout tags/$opencv_version && cd ..

git clone https://github.com/opencv/opencv.git && cd opencv
git checkout tags/$opencv_version

mkdir build && cd build

cmake -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DOPENCV_EXTRA_MODULES_PATH=~/opencv-$opencv_version/opencv_contrib/modules \
    -DPYTHON3_LIBRARY=`python3 -c 'import subprocess ; import sys ; s = subprocess.check_output("python3-config --configdir", shell=True).decode("utf-8").strip() ; (M, m) = sys.version_info[:2] ; print("{}/libpython{}.{}.dylib".format(s, M, m))'` \
    -DPYTHON3_INCLUDE_DIR=`python3 -c 'import distutils.sysconfig as s; print(s.get_python_inc())'` \
    -DPYTHON3_EXECUTABLE=`which python3` \
    -DBUILD_opencv_python2=OFF \
    -DBUILD_opencv_python3=ON \
    -DWITH_TBB=ON \
    -DWITH_V4L=ON \
    -DINSTALL_PYTHON_EXAMPLES=ON \
    -DINSTALL_C_EXAMPLES=OFF \
    -DBUILD_EXAMPLES=ON \
    -DOPENCV_ENABLE_NONFREE=ON ..

sudo make -j$(lscpu -p | egrep -v '^#' | sort -u -t, -k 2,4 | wc -l)
sudo make install

sudo ln -s /usr/local/python/cv2/python-3.6/cv2.cpython-36m-x86_64-linux-gnu.so /usr/local/lib/python3.6/dist-packages
