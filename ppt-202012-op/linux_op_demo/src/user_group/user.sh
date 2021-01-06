#! /bin/bash
# -badname 默认系统不让取大写字符，可以用此参数强制使用非建议用户名规则

echo '添加3年一班'
groupadd class-3-1

echo '添加3年一班老师'
useradd -p $(openssl passwd -1 "123") "teacherA" -m -d /home/teacherA --badnames 
echo '添加3年一班：学生A'
useradd -p $(openssl passwd -1 "123") "studentA" -m -d /home/studentA --badnames 
echo '添加3年一班：学生B'
useradd -p $(openssl passwd -1 "123") "studentB" -m -d /home/studentB --badnames 
echo '添加4年二班：学生C'
useradd -p $(openssl passwd -1 "123") "studentC" -m -d /home/studentC --badnames 


echo '把3年一班老师和学生添加到 class-3-1 组里'
usermod -g class-3-1 teacherA
usermod -g class-3-1 studentA
usermod -g class-3-1 studentB

service ssh stop
echo '启动服务器端 ssh 用于远程用户登录'
service ssh start




