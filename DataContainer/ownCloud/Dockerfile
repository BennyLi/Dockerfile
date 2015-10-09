# Data-only container
# BUILD this with
#   docker build --no-cache -t bennyli/owncloud-data:8.1.3 -t bennyli/owncloud-data .

FROM resin/rpi-raspbian
MAINTAINER Benny Li <benny@benny-li.de>

ENV OWNCLOUD_VERSION 8.1.3

RUN apt-get update

RUN apt-get install -y wget bzip2

RUN mkdir -p /var/www/ && \
    cd /var/www/ && \
    wget -q -O - https://download.owncloud.org/community/owncloud-${OWNCLOUD_VERSION}.tar.bz2 | tar -xj

# Setup config???



VOLUME ["/var/www/owncloud"]
CMD ["true"]
