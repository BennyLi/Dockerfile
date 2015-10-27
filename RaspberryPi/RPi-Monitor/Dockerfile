#
# see also:
#   http://rpi-experiences.blogspot.fr/p/rpi-monitor-installation.html

FROM resin/rpi-raspbian
MAINTAINER Benny Li <benny@benny-li.de>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget apt-transport-https ca-certificates

RUN wget http://goo.gl/rsel0F -O /etc/apt/sources.list.d/rpimonitor.list && \
    apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2C0D3C0F && \
    apt-get update && \
    apt-get install -y rpimonitor && \
    /usr/share/rpimonitor/scripts/updatePackagesStatus.pl

RUN echo "daemon.noserver=1" >> /etc/rpimonitor/daemon.conf && \
    service rpimonitor restart
