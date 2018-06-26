#!/bin/bash

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
sudo apt-get update
sudo apt-get install -y ruby-full ruby-bundler build-essential mongodb-org

# start service
sudo systemctl start mongod
sudo systemctl enable mongod

# get src from repo
cd /home/bossit/
git clone -b monolith https://github.com/express42/reddit

## make build and start puma server
cd reddit
bundle install
puma -d