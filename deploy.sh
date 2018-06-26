#!/bin/bash

# get src from repo
cd /home/bossit/
git clone -b monolith https://github.com/express42/reddit

## make build and start puma server
cd reddit
bundle install
puma -d