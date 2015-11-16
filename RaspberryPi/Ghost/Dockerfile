# Ghost blog
#
# BUILD this with
#   docker build -t bennyli/rpi-ghost .

FROM bennyli/rpi-nodejs
MAINTAINER Benny Li <benny@benny-li.de>

ENV required_node_version 0.10.40
ENV required_npm_version  2.5.0

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl unzip

RUN npm cache clean -f && \
    npm install -g n && \
    current_npm_version=$(npm -v) && \
    [ "${current_npm_version#*$required_npm_version}" != "$current_npm_version" ] || npm install npm@${required_npm_version} -g && \
    current_node_version=$(node -v) && \
    [ "${current_node_version#*$required_node_version}" != "$current_node_version" ] || n ${required_node_version}

RUN curl -L https://ghost.org/zip/ghost-latest.zip -o ghost.zip && \
    mkdir -p /var/www/ghost && \
    unzip -uo ghost.zip -d /var/www/ghost && \
    cd /var/www/ghost && \
    npm install --production

COPY "config.js" "/var/www/ghost/config.js"

RUN rm /ghost.zip

VOLUME ["/var/www/ghost"]
EXPOSE 2368
CMD ["npm", "start", "--production"]
