#!/usr/bin/env bash

docker build --no-cache -t bennyli/owncloud-data:8.1.3 -t bennyli/owncloud-data ./DataContainer/ownCloud
docker build --no-cache -t bennyli/nginx-conf ./DataContainer/nginx

docker build --no-cache -t bennyli/php-fpm ./RaspberryPi/php

# Gateone special
# Use official and build from rpi base image
git clone https://github.com/liftoff/GateOne/
cd GateOne/docker
sed -ni 's/^FROM.*/FROM resin\/rpi-raspbian/g' Dockerfile
docker build --no-cache -t bennyli/rpi-gateone .
