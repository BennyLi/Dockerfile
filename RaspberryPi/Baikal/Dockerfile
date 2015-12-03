# Ghost blog
#
# BUILD this with
#   docker build -t bennyli/rpi-ghost .

FROM bennyli/rpi-php
MAINTAINER Benny Li <benny@benny-li.de>

RUN apt-get update && \
    apt-get install -y git-core php5-curl php5-sqlite

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN cd /var/www && \
    git clone -b branch-2 https://github.com/netgusto/Baikal.git && \
    cd Baikal && \
    cp app/config/defaults/data.parameters.dist.yml data/parameters.yml && \
    cp app/config/defaults/data.environment.dist.yml data/environment.yml && \
    composer install

RUN cd /var/www/Baikal && \
    composer dump-autoload --optimize

# see http://jan.alphadev.net/blog/2014/self-hosted-pim-synchronisation-using-baikal/


VOLUME ["/var/www/Baikal"]
WORKDIR /var/www/Baikal
