#!/bin/bash
set -e  # 脚本出错时立即退出

echo "=========清理已有容器及镜像资源========="
container="jenkins-test"
image=${container}

# 停止并删除容器
if docker ps -a --format '{{.Names}}' | grep -w ${container} > /dev/null; then
    echo "=========停止并删除容器:========= ${container}"
    docker stop ${container} > /dev/null
    docker rm -f ${container} > /dev/null
fi

# 删除镜像
if docker images --format '{{.Repository}}' | grep -w ${image} > /dev/null; then
    echo "=========删除镜像:========= ${image}"
    docker rmi -f ${image} > /dev/null
fi

# 构建镜像
echo "=========镜像制作========="
docker build -t ${image} .

# 运行容器
echo "=========容器运行========="
docker run -d -it --restart=always --name ${container} -p 8088:8088 ${image} -Duser.timezone=GMT+8