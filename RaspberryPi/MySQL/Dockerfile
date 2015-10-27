#
# see also
#   http://haydenjames.io/mysql-query-cache-size-performance/
#

FROM resin/rpi-raspbian
MAINTAINER Benny Li <benny@benny-li.de>

RUN apt-get update && apt-get upgrade -y

RUN apt-get install mysql-server -y
RUN apt-get install gunzip -y

RUN cp /usr/share/doc/mysql-server-5.5/examples/my-small.cnf /etc/mysql/my.cnf
