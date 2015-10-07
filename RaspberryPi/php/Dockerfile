# BUILD this with
#   docker build -t bennyli/rpi-nginx:1.8.0 -t bennyli/rpi-nginx .
# and RUN with
#   docker run -d -p 80:80 -p 443:443 --name my_nginx bennyli/rpi-nginx

# Linking together with Nginx Container
#   http://stackoverflow.com/questions/27055627/docker-nginx-and-php5-fpm-dockers-are-not-talking

# source: https://github.com/docker-library/php/blob/766e3c00431dfb9c4043b8a1c50c2c9195c94b24/5.4/fpm/Dockerfile
FROM resin/rpi-raspbian
MAINTAINER Benny Li <benny@benny-li.de>
# persistent / runtime deps
RUN apt-get update && apt-get install -y ca-certificates curl libpcre3 librecode0 libsqlite3-0 libxml2 --no-install-recommends && rm -r /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y php5-fpm

WORKDIR /var/www

EXPOSE 9000
CMD ["/usr/sbin/php5-fpm", "--nodaemonize"]
