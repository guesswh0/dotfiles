#!/bin/bash

sudo apt-get update -qqy
sudo apt-get upgrade -y

# Tools
sudo apt-get install -qy --fix-missing \
    build-essential \
    git \
    wget \
    curl \
    net-tools\
    zsh \
    pkg-config \
    software-properties-common \
    xz-utils \
    zip

# Python
sudo apt-get install -qy \
    python \
    python-dev \
    python-pip \
    python3 \
    python3-pip \
    python3-dev \
    python3-numpy

# Dependency libs (dlib)
sudo apt-get install -qqy \
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

# Additional libs (pyenv)
sudo apt-get install -qqy \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    tk-dev \
    libffi-dev \
    liblzma-dev

sudo apt-get autoremove -qqy
sudo apt-get clean 
sudo rm -rf /tmp/* /var/tmp/*