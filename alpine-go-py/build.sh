#!/bin/bash

docker build --no-cache -t yibuyiyin/alpine-go-py .
docker images|grep none|awk '{print $3}'|xargs docker rmi -f
