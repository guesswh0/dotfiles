#!/bin/bash
# OpenCV installation script (macos).
# Assume have Apple Command Line Tools $sudo xcode-select --install

# Homebrew
if ! [ -x "$(command -v brew)" ]; then
    printf "\n" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
fi

opencv_version=3.4.4

# [required] Tools used to build and compile
brew install cmake pkg-config

# [optional] Libraries used for image I/O operations 
brew install jpeg libpng libtiff openexr ffmpeg

# [optional] Optimization libraries
brew install eigen tbb

# Python 3.6.5_1 
brew install \
    https://raw.githubusercontent.com/Homebrew/homebrew-core/f2a764ef944b1080be64bd88dca9a1d80130c558/Formula/python.rb

cd $HOME/
mkdir temp && cd temp
git clone https://github.com/opencv/opencv.git
cd opencv && git checkout tags/$opencv_version && cd $HOME/temp

git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib && git checkout tags/$opencv_version && cd $HOME/temp

cd opencv
mkdir build && cd build

cmake -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DOPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
    -DPYTHON3_LIBRARY=`python3 -c 'import subprocess ; import sys ; s = subprocess.check_output("python3-config --configdir", shell=True).decode("utf-8").strip() ; (M, m) = sys.version_info[:2] ; print("{}/libpython{}.{}.dylib".format(s, M, m))'` \
    -DPYTHON3_INCLUDE_DIR=`python3 -c 'import distutils.sysconfig as s; print(s.get_python_inc())'` \
    -DPYTHON3_EXECUTABLE=`which python3` \
    -DBUILD_opencv_python2=OFF \
    -DBUILD_opencv_python3=ON \
    -DWITH_TBB=ON \
    -DWITH_V4L=ON \
    -DINSTALL_PYTHON_EXAMPLES=ON \
    -DINSTALL_C_EXAMPLES=OFF \
    -DOPENCV_ENABLE_NONFREE=ON \
    -DBUILD_EXAMPLES=ON ..

make -j$(sysctl -n hw.physicalcpu)
sudo make install

ln -s /usr/local/python/cv2/python-3.6/cv2.cpython-36m-darwin.so /usr/local/lib/python3.6/site-packages
rm -rf $HOME/temp
