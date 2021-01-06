#! /bin/bash

# 创建目录用于存放证书
mkdir /etc/nginx/ssl-crt
cd /etc/nginx/ssl-crt


################################
# 一. 生成 CA 根证书
################################

# 生成 CA 私钥
openssl genrsa -out crgt1.key 2048

# 生成CA证书请求
openssl req -new -key crgt1.key -out crgt1.csr

# 生成 CA 根证书
openssl x509 -req -in crgt1.csr -extensions v3_ca -signkey crgt1.key -out crgt1.crt


################################
# 二. 根据 CA 根证书 生成 server 端证书
################################

# 生成 CA 私钥
openssl genrsa -out my_server.key 2048 

# 根据 根证书请求生成 server 证书请求
openssl req -new -key my_server.key -out my_server.csr

# 生成 server 端证书
openssl x509 -days 365 -req -in my_server.csr -extensions v3_req -CAkey crgt1.key -CA crgt1.crt -CAcreateserial -out my_server.crt



################################
# 配置 nginx
################################

# 设置 nginx 站点配置文件
cp /demo-lab/nginx/my-site-https.conf /etc/nginx/sites-available/

# 创建硬链接
ln /etc/nginx/sites-available/my-site-https.conf /etc/nginx/sites-enabled/my-site-https.conf

# 停止 nginx 服务器

service nginx stop

# 等同于
# /etc/init.d/nginx stop

# 启动 nginx 服务器
service nginx start




# tips 在 chrome 里面进入不到  未能验证证书的页面。有个秘技，在当前页面输入“thisisunsafe” 即可


