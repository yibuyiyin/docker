FROM alpine:3.9
MAINTAINER yupeng <peng.yu@yibuyiyin.com>

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN echo 'http://mirrors.ustc.edu.cn/alpine/v3.5/main' > /etc/apk/repositories \
    && echo 'http://mirrors.ustc.edu.cn/alpine/v3.5/community' >>/etc/apk/repositories \
    && apk add --no-cache --virtual .build-deps tzdata \
    && mv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del .build-deps \
    && apk add --no-cache rsyslog bash


VOLUME /var/lib/rsyslog

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["rsyslogd", "-n", "-f", "/etc/rsyslog.conf"]
