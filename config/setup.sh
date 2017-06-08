#!/bin/sh

apt-get -y update

# install pip
apt-get -y install python-dev

# install packer
wget https://releases.hashicorp.com/packer/1.0.0/packer_1.0.0_linux_amd64.zip
apt-get install unzip
unzip packer_1.0.0_linux_amd64.zip
mv packer /usr/local/bin
packer version

# install awscli
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
python ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

# install jq
apt-get install jq
