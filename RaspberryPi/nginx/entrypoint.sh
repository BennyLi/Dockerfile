#!/usr/bin/env bash

PHP_UPSTREAM_CONF_FILE="/etc/nginx/global/php-upstream.conf"
if [ -f "$PHP_UPSTREAM_CONF_FILE" ]; then
  sed -ni "s|DOCKER_PHP_PORT|${PHP_PORT}|g" "$PHP_UPSTREAM_CONF_FILE"
fi

REDMINE_UPSTREAM_CONF_FILE="/etc/nginx/global/redmine-upstream.conf"
if [ -f "REDMINE_UPSTREAM_CONF_FILE" ]; then
  sed -ni "s|DOCKER_REDMINE_PORT|${REDMINE_PORT}|g" "$REDMINE_UPSTREAM_CONF_FILE"
fi

GHOST_BLOG_UPSTREAM_CONF_FILE="/etc/nginx/global/ghost-blog-upstream.conf"
if [ -f "$GHOST_BLOG_UPSTREAM_CONF_FILE" ]; then
  sed -ni "s|DOCKER_GHOST_PORT|${GHOST_PORT}|g" "$GHOST_BLOG_UPSTREAM_CONF_FILE"
fi

#nginx -g "daemon off;"
echo "Executing $@"
"$@"
