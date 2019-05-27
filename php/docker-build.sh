#/bin/env bash

base_dir=$PWD
for tag in \
    php-fpm \
    php-fpm-yaf \
    php-fpm-yaf-sphinx \
    php-fpm-yaf-sphinx-xdebug
do
    cd $base_dir/$tag
    docker rmi yibuyiyin/$tag
    docker build -t yibuyiyin/$tag .
    docker push yibuyiyin/$tag
done
