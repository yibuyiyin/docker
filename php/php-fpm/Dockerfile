FROM php:fpm
MAINTAINER yupeng <peng.yu@yibuyiyin.com>

RUN echo "deb http://mirrors.ustc.edu.cn/debian stable main contrib non-free" > /etc/apt/sources.list \
    && echo "deb http://mirrors.ustc.edu.cn/debian stable-updates main contrib non-free" >> /etc/apt/sources.list \
    && rm /etc/apt/sources.list.d/buster.list \
    && apt-get update \
    # set timezone
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    # install icu intl
    && apt-get install -y libicu-dev \
    && curl -o /tmp/icu.tar.gz -L http://download.icu-project.org/files/icu4c/59.1/icu4c-59_1-src.tgz \
    && tar -zxf /tmp/icu.tar.gz -C /tmp && cd /tmp/icu/source && ./configure --prefix=/usr/local \
    && make && make install && rm -rf /tmp/icu/ /tmp/icu.tar.gz \
    && docker-php-ext-configure intl --with-icu-dir=/usr/local \
    && docker-php-ext-install -j $(nproc) intl  \
    # install xhprof
    && mkdir -p /usr/src/php/ext \
    && apt-get install -y libzip-dev zip \
    && curl -L -o /tmp/xhprof.zip https://github.com/tideways/php-xhprof-extension/archive/master.zip \
    && cd /tmp; unzip xhprof.zip; mv php-xhprof-extension-master /usr/src/php/ext/xhprof; rm -f xhprof.zip \
    && docker-php-ext-install -j$(nproc) xhprof \
    # install zip 
    && apt-get install -y libzip-dev zip \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-install -j$(nproc) zip \
    # install gd 
    && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    # install soap
    && apt-get install -y --no-install-recommends libxml2-dev libtidy-dev libxslt1-dev \
    && docker-php-ext-install -j$(nproc) soap wddx xmlrpc tidy xsl \
    # install ldap
    && apt-get install -y --no-install-recommends libldap2-dev \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu \
    && docker-php-ext-install -j$(nproc) ldap \
    # install imap
    && apt-get install -y --no-install-recommends libc-client-dev libkrb5-dev \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install -j$(nproc) imap \
    # install apcu
    && pecl install apcu \
    && pecl install apcu_bc-1.0.3 \
    && docker-php-ext-enable apcu --ini-name 10-docker-php-ext-apcu.ini \
    # install redis
    && pecl install redis && docker-php-ext-enable redis \
    # install phpunit
    && curl -L -o /usr/local/bin/phpunit https://phar.phpunit.de/phpunit-7.0.phar \
    && chmod +x /usr/local/bin/phpunit \
    # install php other ext
    && docker-php-ext-install -j$(nproc) pdo pdo_mysql mysqli pcntl bcmath opcache \
    # clear cache
    && apt-get clean \
    && rm -rf /usr/src/php \
    && rm -rf /var/lib/apt/lists/* 
