#! /bin/bash

# 构建镜像
docker build . -t op-demo-lab:1.0.0

# 停止正在运行的容器
docker stop op-demo-lab

# 移除老的容器
docker rm op-demo-lab

# 运行新容器
docker run --name op-demo-lab -p 80:80 -p 443:443 -p 22:22 -td op-demo-lab:1.0.0 

# 交互式进入容器
docker exec -it op-demo-lab /bin/bash
