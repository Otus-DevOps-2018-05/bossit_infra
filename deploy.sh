#!/bin/bash

cd /home/bossit/
git clone -b monolith https://github.com/express42/reddit

cd reddit
bundle install
puma -d