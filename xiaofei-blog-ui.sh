#!/bin/bash

# 进入xiaofei-blog-ui
cd ./xiaofei-blog-ui

echo "进入xiaofei-blog-ui目录"

# 删除打包项目
rm -rf dist

echo "删除xiaofei-blog-ui——dist打包目录"

# 联网下载依赖
npm install

echo "依赖下载完成"

# 构建
#npm run build 

echo "构建完成"

ls

# 将dist文件夹移动到docker目录下面
# cp ./dist ../../xiaofei-blog/xiaofei-blog/docker/nginx/html/blog/