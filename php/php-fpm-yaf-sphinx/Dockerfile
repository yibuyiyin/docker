FROM itititi/coreseek:latest AS coreseek
WORKDIR /usr/local/src/coreseek/csft-4.1/api/libsphinxclient
RUN aclocal && libtoolize --force && automake --add-missing && autoconf && autoheader \
    && ./configure --prefix=/usr/local/libsphinxclient \
    && make && make install

FROM yibuyiyin/php-fpm-yaf
MAINTAINER yupeng <peng.yu@yibuyiyin.com>

ENV PHPSPHINX_VERSION 339e123

COPY --from=coreseek /usr/local/libsphinxclient/ /tmp/libsphinxclient

# install sphinx and yaf
RUN curl -o /tmp/sphinx-$PHPSPHINX_VERSION.tgz 'http://git.php.net/?p=pecl/search_engine/sphinx.git;a=snapshot;h=339e123acb0ce7beb2d9d4f9094d6f8bcf15fb54;sf=tgz' \
    && tar zxf /tmp/sphinx-$PHPSPHINX_VERSION.tgz -C /tmp \
    && mkdir -p /usr/src/php/ext/ \
    && mv /tmp/sphinx-$PHPSPHINX_VERSION /usr/src/php/ext/sphinx \
    && cp -a /tmp/libsphinxclient/* /usr/local/ \
    && rm -rf /tmp/sphinx-$PHPSPHINX_VERSION.tgz /tmp/libsphinxclient \
    && docker-php-ext-install -j $(nproc) sphinx
