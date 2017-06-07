#!/bin/sh

TERR_DIR=/usr/local/bin

mkdir -p $TERR_DIR
cd $TERR_DIR
wget https://releases.hashicorp.com/terraform/0.9.7/terraform_0.9.7_linux_amd64.zip
apt-get update; apt-get install unzip
unzip terraform_0.9.7_linux_amd64.zip
