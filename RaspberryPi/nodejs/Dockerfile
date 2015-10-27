# Node.js base image to use for setting up Node.js apps like Ghost
#
# BUILD this with
#   docker build --no-cache -t bennyli/rpi-nodejs .

FROM resin/rpi-raspbian
MAINTAINER Benny Li <benny@benny-li.de>

ENV build_deps "build-essential"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget python ${build_deps}

RUN mkdir /usr/local/src/nodejs && \
    cd /usr/local/src/nodejs && \
    wget http://nodejs.org/dist/latest-v0.10.x/SHASUMS.txt && \
    echo "http://nodejs.org/dist/latest-v0.10.x/$(sed -nr 's/.*(node-v0\.10\.[0-9]+\.tar\.gz).*/\1/p' SHASUMS.txt| head -1)" && \
    tar xzf ./node*.tar.gz --strip-components=1 -C ./ && \
    ./configure && \
    make && \
    make install && \
    make clean && \
    echo "Installed node.js version $(node -v)"

RUN apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false -o APT::AutoRemove::SuggestsImportant=false ${build_deps}
RUN rm -rf /usr/local/src/*
