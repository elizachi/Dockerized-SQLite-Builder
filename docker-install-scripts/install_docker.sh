#!/bin/bash

apt-get update

apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian bullseye stable"

apt-get update

apt-get install -y docker-ce

systemctl start docker
systemctl enable docker

usermod -aG docker vagrant
