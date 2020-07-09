FROM golang:alpine
MAINTAINER yupeng <peng.yu@yibuyiyin.com>

ENV TZ "Asia/Shanghai"

#RUN sed -i 's/dl-cdn.alpinelinux.org\/alpine\/v3.12/mirror.tuna.tsinghua.edu.cn\/alpine\/v3.5/g' /etc/apk/repositories &&\
RUN sed -i 's/dl-cdn.alpinelinux.org/mirror.tuna.tsinghua.edu.cn/g' /etc/apk/repositories && \
        apk add --no-cache python3 && \
        apk add --no-cache --virtual=build-dependencies \
        py3-pip g++ build-base libffi-dev python3-dev \
        libffi openssl ca-certificates \
        jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev \
        linux-headers pcre-dev openssh && \
        pip3 install --upgrade pip  --no-cache-dir -i http://mirrors.aliyun.com/pypi/simple/ \
        --trusted-host mirrors.aliyun.com && \
        pip3 install --no-cache-dir -i http://mirrors.aliyun.com/pypi/simple/ \
        --trusted-host mirrors.aliyun.com pexpect && \
        apk del g++ && \
        apk del --purge \
        build-dependencies && \
        rm -rf \
        /root/.cache \
        /tmp/*

EXPOSE 8080
