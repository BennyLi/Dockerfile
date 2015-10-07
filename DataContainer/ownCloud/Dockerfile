# Data-only container

FROM resin/rpi-raspbian
MAINTAINER Benny Li <benny@benny-li.de>

ENV OWNCLOUD_VERSION 8.1.3

RUN apt-get update

RUN apt-get install -y wget

RUN mkdir -p /var/www/ && \
    cd /var/www/ && \
    wget https://download.owncloud.org/community/owncloud-${OWNCLOUD_VERSION}.tar.bz2 -O - | tar -xj

# Setup config???



VOLUME ["/var/www/owncloud"]
CMD ["true"]
