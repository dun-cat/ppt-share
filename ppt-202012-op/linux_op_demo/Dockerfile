FROM ubuntu

WORKDIR /demo-lab

# 复制 src/下的所有文件 到当前工作目录
COPY ./src/ ./

# 安装 acl管理工具

# 正常情况使用 update 命令获取最新远程软件列表索引
# 具体包的信息可以  https://packages.debian.org/包名 检索


# 安装 必要演示工具

# acl ACL权限工具
# nginx 服务器软件
# openssl 用于生成SSL证书
# curl 用于测试http网络连通性
# netcat 有瑞士军刀之称，使用UDP/TCP协议用于网络端口监听， 我们这里用于 nginx 反向代理的demo演示
# openssh-server 用于 ssh 登录

# vim 编辑器

RUN apt-get update \
  && apt-get install acl \
  && apt-get install -y nginx \
  && apt-get install -y openssl \
  && apt-get install -y curl \
  && apt-get install -y netcat \
  && apt-get install -y openssh-server \
  && apt-get install -y vim


# 给当前目录及文件添加可执行权限
RUN  chmod -R +x ./

# 主机暴露端口

# ftp 20 21
# ssh 22
# http 80
# https 443

EXPOSE 20
EXPOSE 21
EXPOSE 22
EXPOSE 80
EXPOSE 443

# 只有最后一个CMD有效
# CMD 