#!/bin/bash

# Docker 镜像名
IMAGE_NAME=jenkins-test-app

# 构建 Docker 镜像
docker build -t $IMAGE_NAME $WORKSPACE

# 停止并删除旧容器（如果存在）
if [ $(docker ps -aq -f name=jenkins-test) ]; then
    docker rm -f jenkins-test
fi

# 启动新容器
docker run -d -p 8888:8888 --name jenkins-test $IMAGE_NAME
