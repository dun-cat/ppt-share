#! /bin/bash

# 2.设置 nginx 代理配置

# 设置 nginx 站点配置文件
cp ./proxy.conf /etc/nginx/conf.d/
cp ./demo-app-proxy.conf /etc/nginx/conf.d/


# 停止 nginx 服务器
service nginx stop

# 启动 nginx 服务器
service nginx start



# 1.设置上游服务应用程序响应
while true; do { echo -e "HTTP/1.0 200 OK\r\n\r\n<h1><meta charset=\"UTF-8\"></meta>我是上游服务器响应的哦 嘤嘤婴！</h1>" |  nc -vl -q 0 520; } done






