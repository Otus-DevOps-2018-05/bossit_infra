#!/bin/bash

gcloud compute instances create reddit-app-full \
  --boot-disk-size=10GB \
  --image-family=reddit-base \
  --machine-type=g1-small \
  --tags=puma-server \
  --zone=europe-west1-b
  --restart-on-failure
