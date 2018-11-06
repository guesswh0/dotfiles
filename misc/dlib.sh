#!/bin/bash

cd $HOME
mkdir -p dlib
git clone -b 'v19.9' --single-branch https://github.com/davisking/dlib.git dlib
cd  dlib
sudo python3 setup.py install --yes USE_AVX_INSTRUCTIONS --yes DLIB_USE_CUDA