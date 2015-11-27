# BUILD this with
#   docker build -t bennyli/rpi-nginx:1.8.0 -t bennyli/rpi-nginx .
#
# Be sure to create a DATA-ONLY Container:
#
#
# and RUN with
#   docker run -d -p 80:80 -p 443:443 --name my_nginx --volumes-from storage-www bennyli/rpi-nginx

FROM resin/rpi-raspbian
MAINTAINER Benny Li <benny@benny-li.de>
# see also https://github.com/akkerman/docker-rpi-nginx/blob/wheezy/Dockerfile

ENV nginx_version 1.8.0
ENV pcre_version 8.32
ENV zlib_version 1.2.7
ENV build_deps "build-essential libssl-dev"

RUN apt-get update && apt-get upgrade -y

# Install custom nginx version
RUN apt-get install -y wget git
# libpcre3 libpcre3-dev

# Install dependencies
RUN apt-get install -y ${build_deps}

RUN cd /usr/local/src && \
    wget http://downloads.sourceforge.net/project/pcre/pcre/${pcre_version}/pcre-${pcre_version}.tar.gz -O - | tar -xz

RUN cd /usr/local/src && \
    wget http://downloads.sourceforge.net/project/libpng/zlib/${zlib_version}/zlib-${zlib_version}.tar.gz -O - | tar -xz

RUN cd /usr/local/src && \
    wget http://nginx.org/download/nginx-${nginx_version}.tar.gz -O - | tar -xz

# Additional modules
RUN mkdir /usr/local/src/nginx-${nginx_version}/modules && \
    cd /usr/local/src/nginx-${nginx_version}/modules && \
    git clone https://github.com/gnosek/nginx-upstream-fair && \
    git clone https://github.com/yaoweibin/nginx_upstream_check_module
    # https://github.com/kvspb/nginx-auth-ldap
    # https://github.com/pagespeed/ngx_pagespeed
    # https://github.com/alibaba/nginx-http-sysguard

RUN cd /usr/local/src/nginx-${nginx_version} && \
    ./configure \
        --prefix=/var/www \
        --sbin-path=/usr/sbin/nginx \
        --conf-path=/etc/nginx/nginx.conf \
        --pid-path=/var/run/nginx.pid \
        --error-log-path=/var/log/nginx/error.log \
        --http-log-path=/var/log/nginx/access.log \
        --with-pcre-jit \
        --with-debug \
        --with-ipv6 \
        --with-sha1=/usr/include/openssl \
        --with-md5=/usr/include/openssl \
        --with-http_ssl_module \
        --without-http_proxy_module \
        --add-module=/usr/local/src/nginx-${nginx_version}/modules/nginx-upstream-fair \
        --add-module=/usr/local/src/nginx-${nginx_version}/modules/nginx_upstream_check_module \
        --with-pcre=/usr/local/src/pcre-${pcre_version} \
        --with-zlib=/usr/local/src/zlib-${zlib_version} \
        --with-http_dav_module \
        --with-http_spdy_module \
        --with-http_realip_module \
        --with-http_gzip_static_module

RUN cd /usr/local/src/nginx-${nginx_version} && \
    make && \
    make install && \
    make clean

#RUN apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false -o APT::AutoRemove::SuggestsImportant=false ${build_deps}
RUN rm -rf /usr/local/src/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

#VOLUME ["/var/www"]
#VOLUME ["/etc/nginx"]

EXPOSE 80 443

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx"]
