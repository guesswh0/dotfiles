#!/bin/bash
# OpenCV installation script (macos).
# Assume have Apple Command Line Tools $sudo xcode-select --install

# Homebrew
if ! [ -x "$(command -v brew)" ]; then
    printf "\n" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
fi

opencv_version=3.4.7

# [required] Tools used to build and compile
brew install cmake pkg-config

# [optional*] Libraries used for image I/O operations 
brew install jpeg libpng libtiff openexr

# [optional**] Optimization libraries
brew install eigen tbb hdf5 

# sphynx-doc bug
# brew install python
# brew unlink python
# brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/f2a764ef944b1080be64bd88dca9a1d80130c558/Formula/python.rb
# brew switch python 3.6.5_1

mkdir $HOME/opencv && cd $HOME/opencv
wget -O opencv.zip https://github.com/opencv/opencv/archive/$opencv_version.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/$opencv_version.zip
unzip opencv.zip
unzip opencv_contrib.zip

cd opencv-$opencv_version
mkdir build && cd build

cmake -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DPYTHON3_LIBRARY=`python3 -c 'import subprocess ; import sys ; s = subprocess.check_output("python3-config --configdir", shell=True).decode("utf-8").strip() ; (M, m) = sys.version_info[:2] ; print("{}/libpython{}.{}.dylib".format(s, M, m))'` \
    -DPYTHON3_INCLUDE_DIR=`python3 -c 'import distutils.sysconfig as s; print(s.get_python_inc())'` \
    -DPYTHON3_EXECUTABLE=`which python3` \
    -DBUILD_opencv_python2=OFF \
    -DBUILD_opencv_python3=ON ..

make -j$(sysctl -n hw.physicalcpu)
sudo make install

# link to destination site-package
# ln -s /usr/local/lib/python3.6/site-packages/cv2/python-3.6/cv2.cpython-36m-darwin.so /path/dest/site-package/
