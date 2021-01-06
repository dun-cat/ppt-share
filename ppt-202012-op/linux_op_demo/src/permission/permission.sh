#! /bin/bash

echo "老师角色登录"

echo '创建学习库 study-lib'
mkdir study-lib

echo '取消其他用户的 study-lib 的权限'
chmod o-xr ./study-lib

echo "给学生C 设置 ACL访问权限"
setfacl -m u:studentC:r study-lib

echo "查看study-lib 的acl权限列表"
getfacl study-lib

# 可以删除 ACL 设置
# setfacl -x u:studentC study-lib