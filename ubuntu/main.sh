#!/bin/bash

sudo apt-get update -qqy
sudo apt-get upgrade

sudo apt-get install -y --fix-missing \
    build-essential \
    git \
    wget \
    curl \
    zsh \
    graphicsmagick \
    libgraphicsmagick1-dev \
    libatlas-base-dev \
    libavcodec-dev \
    libavformat-dev \
    libgtk2.0-dev \
    libjpeg-dev \
    libopenblas-dev \
    liblapack-dev \
    libswscale-dev \
    pkg-config \
    software-properties-common \
    zip

# Python
sudo apt-get install python3 python3-pip python3-dev python3-numpy

# update cmake to 12.3
# ./cmake

sudo apt-get autoremove -qqy
sudo apt-get clean 
sudo rm -rf /tmp/* /var/tmp/*