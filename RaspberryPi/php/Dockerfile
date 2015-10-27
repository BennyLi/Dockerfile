# BUILD this with
#   docker build --no-cache -t bennyli/php-fpm .
# and RUN with
#   docker run -d -p 80:80 -p 443:443 --name my_nginx bennyli/rpi-nginx

# Linking together with Nginx Container
#   http://stackoverflow.com/questions/27055627/docker-nginx-and-php5-fpm-dockers-are-not-talking

# source: https://github.com/docker-library/php/blob/766e3c00431dfb9c4043b8a1c50c2c9195c94b24/5.4/fpm/Dockerfile
FROM resin/rpi-raspbian
MAINTAINER Benny Li <benny@benny-li.de>

RUN apt-get update && apt-get upgrade -y

# persistent / runtime deps
RUN apt-get install -y ca-certificates curl libpcre3 librecode0 libsqlite3-0 libxml2 --no-install-recommends && rm -r /var/lib/apt/lists/*

RUN apt-get install -y php5-fpm php5-mysql

WORKDIR /var/www

EXPOSE 9000
CMD ["/usr/sbin/php5-fpm", "--nodaemonize"]
