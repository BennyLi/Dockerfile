# Data-only container
# BUILD this with
#   docker build --no-cache -t bennyli/nginx-conf .

FROM resin/rpi-raspbian
MAINTAINER Benny Li <benny@benny-li.de>

COPY nginx.conf /etc/nginx/nginx.conf

VOLUME ["/etc/nginx"]
CMD ["true"]
