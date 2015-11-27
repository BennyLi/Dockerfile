# Ghost blog
#
# BUILD this with
#   docker build -t bennyli/rpi-ghost .

FROM resin/rpi-raspbian
MAINTAINER Benny Li <benny@benny-li.de>

RUN apt-get update && \
    apt-get install -y curl unzip

RUN curl -L https://ghost.org/zip/ghost-latest.zip -o ghost.zip && \
    mkdir -p /var/www/ghost && \
    unzip -uo ghost.zip -d /var/www/ghost

COPY config.js /var/www/ghost/

RUN rm /ghost.zip

VOLUME ["/var/www/ghost"]
WORKDIR /var/www/ghost
CMD ["echo", "Ghost Blog data container"]
