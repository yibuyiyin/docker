#!/bin/bash

docker build --no-cache -t yibuyiyin/go-iris \
    --network host \
    --build-arg HTTP_PROXY=http://127.0.0.1:8888 \
    --build-arg HTTPS_PROXY=http://127.0.0.1:8888 \
    --build-arg http_proxy=http://127.0.0.1:8888 \
    --build-arg https_proxy=http://127.0.0.1:8888 \
    .

docker images|grep none|awk '{print $3}'|xargs docker rmi -f
