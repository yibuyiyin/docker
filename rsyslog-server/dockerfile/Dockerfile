FROM alpine:3.5
MAINTAINER yupeng <peng.yu@yibuyiyin.com>

COPY ./rsyslog.conf /etc/rsyslog.conf
COPY ./loglanding.sh /usr/local/bin/loglanding.sh

RUN echo 'http://mirrors.ustc.edu.cn/alpine/v3.5/main' > /etc/apk/repositories \
    && echo 'http://mirrors.ustc.edu.cn/alpine/v3.5/community' >>/etc/apk/repositories \
    && apk add --no-cache --virtual .build-deps tzdata \
    && mv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del .build-deps \
    && apk add --no-cache rsyslog bash

VOLUME /var/run/rsyslog
VOLUME /var/log/rsyslog
VOLUME /var/lib/rsyslog

EXPOSE 514

ENTRYPOINT ["rsyslogd", "-n", "-f", "/etc/rsyslog.conf"]
