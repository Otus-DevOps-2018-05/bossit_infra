#!/bin/bash

git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install

sudo mv /tmp/redditd.service /etc/systemd/system/
sudo systemctl enable redditd