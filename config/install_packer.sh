#!/bin/sh

wget https://releases.hashicorp.com/packer/1.0.0/packer_1.0.0_linux_amd64.zip
apt-get update
apt-get install unzip
unzip packer_1.0.0_linux_amd64.zip
mv packer /usr/local/bin
packer version
