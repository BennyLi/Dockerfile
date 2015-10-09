#!/usr/bin/env bash

sed -ni "s|DOCKER_PHP_PORT|${PHP_PORT}|g" /etc/nginx/global/php-upstream.conf
sed -ni "s|DOCKER_REDMINE_PORT|${REDMINE_PORT}|g" /etc/nginx/global/redmine-upstream.conf
sed -ni "s|DOCKER_NODEJS_PORT|${NODEJS_PORT}|g" /etc/nginx/global/nodejs-upstream.conf
$@
