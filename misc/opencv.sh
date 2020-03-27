#!/bin/bash

opencv_version=3.4.9
python_version=3.6.10
kernel="$(uname -s)"

if ! [ "$command -v pyenv" ]; then
    echo 'Install pyenv'
    exit
fi

eval "$(pyenv init -)"
pyenv shell $python_version
pip install numpy

wget -O /tmp/opencv.zip https://github.com/opencv/opencv/archive/$opencv_version.zip
wget -O /tmp/opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/$opencv_version.zip

if [ "$kernel" = "Darwin" ]; then
    if ![ -x "$(command -v brew)" ]; then
        printf "\n" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
    fi
    # [required] Tools used to build and compile
    brew install cmake pkg-config
    # [optional*] Libraries used for image I/O operations 
    brew install jpeg libpng libtiff openexr
    # brew install ffmpeg
    # [optional**] Optimization libraries
    brew install eigen tbb

    mkdir -p /usr/local/opt/opencv-$opencv_version
    cd /usr/local/opt/opencv-$opencv_version
else
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

    mkdir -p /opt/opencv-$opencv_version 
    cd /opt/opencv-$opencv_version
fi

unzip /tmp/opencv.zip && mv opencv-$opencv_version opencv
unzip /tmp/opencv_contrib.zip && mv opencv_contrib-$opencv_version opencv_contrib
cd opencv && mkdir build && cd build

PREFIX=`pyenv prefix`
sudo cmake -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DPYTHON3_EXECUTABLE=$PREFIX/bin/python3 \
    -DPYTHON3_LIBRARY=`python3 -c 'import subprocess; import sys; s = subprocess.check_output("python3-config --configdir", shell=True).decode("utf-8").strip(); (M, m) = sys.version_info[:2]; print("{}/libpython{}.{}m.dylib".format(s, M, m))'` \
    -DPYTHON3_INCLUDE_DIR=`python3 -c 'import distutils.sysconfig as s; print(s.get_python_inc())'` \
    -DOPENCV_EXTRA_MODULES_PATH=/opt/opencv-$opencv_version/opencv_contrib/modules \
    -DWITH_TBB=ON \
    -DWITH_EIGEN=ON \
    -DBUILD_opencv_python2=OFF \
    -DBUILD_opencv_python3=ON ..

if [ "$kernel" = "Darwin" ]; then
    sudo make -j$(sysctl -n hw.physicalcpu)
else
    sudo make -j$(lscpu -p | egrep -v '^#' | sort -u -t, -k 2,4 | wc -l)
fi
sudo make install