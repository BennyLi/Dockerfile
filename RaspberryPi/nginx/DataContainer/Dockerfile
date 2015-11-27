# Data-only container
# BUILD this with
#   docker build --no-cache -t bennyli/nginx-conf .

FROM bennyli/nginx
MAINTAINER Benny Li <benny@benny-li.de>

RUN mkdir -p /etc/nginx/global && \
    mkdir -p /etc/nginx/sites-available/apps && \
    mkdir -p /etc/nginx/sites-enabled/apps && \
    mkdir -p /var/www

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/sites-available/benny-li.conf /etc/nginx/sites-available/benny-li.conf
COPY nginx/sites-available/benny-li-ssl.conf /etc/nginx/sites-available/benny-li-ssl.conf

RUN ln -s /etc/nginx/sites-available/benny-li.conf /etc/nginx/sites-enabled/benny-li.conf
RUN ln -s /etc/nginx/sites-available/benny-li-ssl.conf /etc/nginx/sites-enabled/benny-li-ssl.conf

COPY nginx/global/restrictions.conf /etc/nginx/global/restrictions.conf
#COPY nginx/global/ghost-blog-upstream.conf /etc/nginx/global/ghost-blog-upstream.conf

#COPY nginx/site-available/apps/ghost.conf /etc/nginx/site-available/apps/ghost.conf

# Symlink active apps
#RUN ln -s /etc/nginx/sites-available/apps/ghost.conf /etc/nginx/sites-enabled/apps/ghost.conf


# COPY CERT FILES (not provided)
COPY nginx/certs/server.key /etc/nginx/certs/server.key
COPY nginx/certs/ca.crt /etc/nginx/certs/ca.crt
COPY nginx/certs/server-ca.crt /etc/nginx/certs/server-ca.crt
COPY nginx/certs/server.crt /etc/nginx/certs/server.crt
RUN cat /etc/nginx/certs/server-ca.crt /etc/nginx/certs/ca.crt > /etc/nginx/certs/chained-ca.crt && \
    cat /etc/nginx/certs/server.crt /etc/nginx/certs/chained-ca.crt > /etc/nginx/certs/server.chained.crt

VOLUME ["/etc/nginx"]
VOLUME ["/var/www"]
CMD ["true"]
