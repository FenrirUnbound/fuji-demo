#!/bin/sh

sudo apt-get -y update

# download node
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

# move application to proper location
APP_LOCATION=/usr/src/app

sudo mv /tmp/application $APP_LOCATION
sudo chown -R ubuntu:nogroup $APP_LOCATION
sudo chmod -R g+r $APP_LOCATION
sudo chmod -R g-w $APP_LOCATION

# install node dependencies
cd $APP_LOCATION
npm install

# move service file to proper location
sudo mv /tmp/fujiapp.service /etc/systemd/system/fujiapp.service

# configure screwdriver service to be automatically started at boot time
sudo systemctl enable fujiapp
