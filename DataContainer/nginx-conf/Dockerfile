# Data-only container
# BUILD this with
#   docker build --no-cache -t bennyli/nginx-conf .

FROM resin/rpi-raspbian
MAINTAINER Benny Li <benny@benny-li.de>

RUN mdkir -p /etc/nginx/global && \
    mdkir -p /etc/nginx/sites-available

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/site-available/benny-li.conf /etc/nginx/site-available/benny-li.conf
COPY nginx/site-available/benny-li-ssl.conf /etc/nginx/site-available/benny-li-ssl.conf

# TODO COPY CERT FILES !!!

VOLUME ["/etc/nginx"]
CMD ["true"]
