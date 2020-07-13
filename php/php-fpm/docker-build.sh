#!/usr/bin/env bash

if [ ! -d "software/icu4c/" ]; then
    echo "Install icu4c"
    echo "Enter the page to download. https://codeload.github.com/unicode-org/icu/tar.gz/release-59-2"
    echo "Decompression to software/icu4c/"
    exit 1
fi

if [ ! -d "software/php-xhprof-extension-master" ]; then
    echo "Install xhprof"
    curl -L -o software/xhprof.zip https://github.com/tideways/php-xhprof-extension/archive/master.zip
    cd software && unzip xhprof.zip && cd -
fi

docker build -t yibuyiyin/php-fpm-test .
