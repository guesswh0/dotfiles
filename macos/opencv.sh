#!/bin/bash
# OpenCV installation script (macos).
# Assume have Apple Command Line Tools $sudo xcode-select --install

# references
# https://docs.opencv.org/master/d7/d9f/tutorial_linux_install.html
# https://stackoverflow.com/questions/33250375/compiling-opencv3-with-pyenv-using-python-3-5-0-on-osx
# https://hackmd.io/@liangcc/BJB-Asp1-?type=view


# Homebrew
if ! [ -x "$(command -v brew)" ]; then
    printf "\n" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
fi

opencv_version=3.4.7

# pyenv python version
python_version=3.6.9 

# use pyenv shell
pyenv shell $python_version

# install numpy
pip3 install numpy~=1.16.4

# [required] Tools used to build and compile
brew install cmake pkg-config

# [optional*] Libraries used for image I/O operations 
brew install jpeg libpng libtiff openexr
# brew install ffmpeg

# [optional**] Optimization libraries
brew install eigen tbb

# dependencies easy way
# brew install opencv --only-dependencies
# brew install opencv@3 --only-dependencies

mkdir -p /usr/local/opt/opencv-$opencv_version && cd /usr/local/opt/opencv-$opencv_version

wget -O opencv.zip https://github.com/opencv/opencv/archive/$opencv_version.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/$opencv_version.zip

# unzip and rename
unzip opencv.zip && mv opencv-$opencv_version opencv
unzip opencv_contrib.zip && mv opencv_contrib-$opencv_version opencv_contrib

cd opencv && mkdir build && cd build

# cmake without contrib extra modules
PREFIX=`pyenv prefix`
cmake -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=/usr/local/opencv/opencv-$opencv_version \
    -DPYTHON3_EXECUTABLE=$PREFIX/bin/python3 \
    -DPYTHON3_LIBRARY=`python3 -c 'import subprocess; import sys; s = subprocess.check_output("python3-config --configdir", shell=True).decode("utf-8").strip(); (M, m) = sys.version_info[:2]; print("{}/libpython{}.{}m.dylib".format(s, M, m))'` \
    -DPYTHON3_INCLUDE_DIR=`python3 -c 'import distutils.sysconfig as s; print(s.get_python_inc())'` \
    -DWITH_TBB=ON \
    -DWITH_EIGEN=ON \
    -DBUILD_opencv_python2=OFF \
    -DBUILD_opencv_python3=ON ..

# to build with contrib add
# OPENCV_EXTRA_MODULES_PATH=/usr/local/opencv/opencv-$opencv_version/opencv_contrib/modules

make -j$(sysctl -n hw.physicalcpu)
sudo make install