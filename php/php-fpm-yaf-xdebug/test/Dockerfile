FROM php:7.2.32-fpm
MAINTAINER yupeng <peng.yu@yibuyiyin.com>

COPY sources.list /etc/apt/sources.list
RUN apt-get update \
    # set timezone \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone
# install yaf
RUN pecl install yaf-3.0.9 \
    && docker-php-ext-enable yaf
# install zip
RUN apt-get install -y libzip-dev zip \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-install -j$(nproc) zip
# install gd
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd
# install soap
RUN apt-get install -y libxml2-dev libtidy-dev libxslt1-dev \
    && docker-php-ext-install -j$(nproc) soap wddx xmlrpc tidy xsl
# install ldap
RUN apt-get install -y libldap2-dev \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu \
    && docker-php-ext-install -j$(nproc) ldap
# install imap
RUN apt-get install -y libc-client-dev libkrb5-dev \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install -j$(nproc) imap
# install apcu
RUN pecl install apcu \
    && docker-php-ext-enable apcu --ini-name 10-docker-php-ext-apcu.ini
# install redis
RUN pecl install redis-5.3.1 \
    && docker-php-ext-enable redis
# install phpunit
RUN curl -L -o /usr/local/bin/phpunit https://phar.phpunit.de/phpunit-7.0.phar \
    && chmod +x /usr/local/bin/phpunit
# install xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug
# install php other ext
RUN docker-php-ext-install -j$(nproc) pdo pdo_mysql mysqli pcntl bcmath opcache \
    # clear cache \
    && apt-get clean \
    && rm -rf /usr/src/php \
    && rm -rf /var/lib/apt/lists/*
