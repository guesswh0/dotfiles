#!/bin/bash

sudo apt-get update -qqy
sudo apt-get upgrade -y

sudo apt-get install -qy --fix-missing \
    build-essential \
    git \
    wget \
    curl \
    net-tools\
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

sudo apt-get autoremove -qqy
sudo apt-get clean 
sudo rm -rf /tmp/* /var/tmp/*