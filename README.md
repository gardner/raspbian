docker image based on raspbian jessie minbase debootstrap variant

# Raspbian docker base image
It is difficult to verify base images as the initial commit generally includes only a minimal Dockerfile and a large binary root.tar.xz file. 

## Build process
  Raspbian `2017-06-21-raspbian-jessie-lite.img` was installed on a Raspberry Pi 3 then debbootstrap was used to download boostrap files from the apt repository.

    sudo apt-get update && sudo apt-get upgrade -y
    sudo apt-get install git make debootstrap -y
    curl -sSL https://get.docker.com | sh

    git clone https://github.com/jmtd/debian-docker.git
    cd debian-docker/
    sudo make release=jessie prefix=gardner arch=armhf mirror=http://mirrordirector.raspbian.org/raspbian/

This results in a directory `jessie-armhf` that contains a `Dockerfile` and a `root.tar`. The Dockerfile was modified to use the raspbian apt repo and a compressed version of `root.tar`.

Alternatively the Makefile can be inspected and the steps run manually.
