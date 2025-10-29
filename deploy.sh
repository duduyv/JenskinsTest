#!/bin/bash

# ------------------------
# 配置
# ------------------------
IMAGE_NAME=jenkins-test-app
CONTAINER_NAME=jenkins-test-app-run
HOST_PORT=8081
CONTAINER_PORT=10001

# ------------------------
# 构建 Docker 镜像
# ------------------------
echo "构建 Docker 镜像: $IMAGE_NAME"
docker build -t $IMAGE_NAME $WORKSPACE

# ------------------------
# 停止并删除旧容器（如果存在）
# ------------------------
EXISTING_CONTAINER=$(docker ps -aq -f name=$CONTAINER_NAME)
if [ "$EXISTING_CONTAINER" ]; then
    echo "删除旧容器: $CONTAINER_NAME"
    docker rm -f $CONTAINER_NAME
fi

# ------------------------
# 启动新容器
# ------------------------
echo "启动新容器: $CONTAINER_NAME"
docker run -d -p $HOST_PORT:$CONTAINER_PORT --name $CONTAINER_NAME $IMAGE_NAME

echo "部署完成！访问 http://localhost:$HOST_PORT"
