 #!/bin/bash
# docker-ce installation script (ubuntu)
# https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-from-a-package

# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc
## SET UP THE REPOSITORY
# 1. Update the apt package index
sudo apt-get update
# 2. Install packages to allow apt to use a repository over HTTPS
sudo apt-get install 
   apt-transport-https \
   ca-certificates \
   curl \
   gnupg-agent \
   software-properties-common
# 3. Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Verify that you now have the key with the fingerprint 
# 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88
sudo apt-key fingerprint 0EBFCD88
# 4. Use the following command to set up the 'stable' repository.
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

## INSTALL DOCKER ENGINE - COMMUNITY
# 1. Update the apt package index
sudo apt-get update
# 2. Install the latest version of Docker Engine - Community and containerd
sudo apt-get install docker-ce docker-ce-cli containerd.io

## Manage Docker as a non-root user
# 1. Create the docker group
sudo groupadd docker
# 2. Add your user to the docker group
sudo usermod -aG docker $USER

# Configure Docker to start on boot
# sudo systemctl enable docker