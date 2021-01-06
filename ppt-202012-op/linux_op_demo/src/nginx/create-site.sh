#! /bin/bash

# 设置 nginx 站点配置文件
cp ./my-site.conf /etc/nginx/sites-available/

# 创建硬链接
ln /etc/nginx/sites-available/my-site.conf /etc/nginx/sites-enabled/my-site.conf

# 停止 nginx 服务器
service nginx stop

# 等同于
# /etc/init.d/nginx stop

# 启动 nginx 服务器
service nginx start


