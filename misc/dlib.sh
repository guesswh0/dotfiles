#!/bin/bash

cd $HOME
mkdir -p dlib
git clone -b 'v19.9' --single-branch https://github.com/davisking/dlib.git dlib
cd  dlib
mkdir build
cd build
cmake .. -DDLIB_USE_CUDA=1 -DUSE_AVX_INSTRUCTIONS=1
cmake --build .
cd ..

# activate virtualenv
# python setup.py install --yes USE_AVX_INSTRUCTIONS --yes DLIB_USE_CUDA