# Data-only container
# BUILD this with
#   docker build --no-cache -t bennyli/nginx-conf .

FROM resin/rpi-raspbian
MAINTAINER Benny Li <benny@benny-li.de>

RUN mdkir -p /etc/nginx/global && \
    mdkir -p /etc/nginx/sites-available/apps && \
    mdkir -p /etc/nginx/sites-enabled/apps

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/site-available/benny-li.conf /etc/nginx/site-available/benny-li.conf
COPY nginx/site-available/benny-li-ssl.conf /etc/nginx/site-available/benny-li-ssl.conf

COPY nginx/global/ghost-blog-upstream.conf /etc/nginx/global/ghost-blog-upstream.conf

COPY nginx/site-available/apps/ghost.conf /etc/nginx/site-available/apps/ghost.conf

# Symlink active apps
RUN ln -s /etc/nginx/sites-enabled/apps/ghost.conf /etc/nginx/sites-available/apps/ghost.conf


# COPY CERT FILES (not provided)
COPY nginx/cert/server.key /etc/nginx/certs/server.key
COPY nginx/cert/ca.crt /etc/nginx/certs/ca.crt
COPY nginx/cert/server-ca.crt /etc/nginx/certs/server-ca.crt
COPY nginx/cert/server.crt /etc/nginx/certs/server.crt
RUN cat /etc/nginx/certs/server-ca.crt /etc/nginx/certs/ca.crt > /etc/nginx/certs/chained-ca.crt && \
    cat /etc/nginx/certs/server.crt /etc/nginx/certs/chained-ca.crt > /etc/nginx/certs/server.chained.crt

VOLUME ["/etc/nginx"]
CMD ["true"]
