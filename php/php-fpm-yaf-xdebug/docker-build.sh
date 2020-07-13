#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "usage: ./docker-build.sh [test|product]"
    exit 1
fi

env=$1
if [ ! -d $env ]; then
    echo "error: $env/ not exists."
    exit 1
fi

cp -a -f sources.list $env/ && \
cd $env && \
docker build -t yibuyiyin/php-fpm-yaf-xdebug:$env-$(date '+%Y%m%d') . && \
rm sources.list
