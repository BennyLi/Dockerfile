#!/usr/bin/env bash

sed -ni "s|DOCKER_PHP_PORT|${PHP_PORT}|g" /etc/nginx/global/php-upstream.conf
sed -ni "s|DOCKER_REDMINE_PORT|${REDMINE_PORT}|g" /etc/nginx/global/redmine-upstream.conf
sed -ni "s|DOCKER_GHOST_PORT|${GHOST_PORT}|g" /etc/nginx/global/ghost-blog-upstream.conf
$@
