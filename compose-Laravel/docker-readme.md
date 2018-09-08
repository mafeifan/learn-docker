### 运行

1. 检查 docker-compose 中的端口，避免与本地的冲突
2. 执行 `docker-compose up` 启动相关容器

### 注意
1. 如果修改了某一 dockerfile 后要重建镜像
`docker-compose build --no-cache`
2. 关于PHP，默认是7.0.31，如果需要安装其他版本，修改php/Dockerfile中的第一行
FROM php:x.x.x-fpm
关于配置文件，php容器内没有主配置文件，需要从源码中获取，并添加映射路径/usr/local/etc/php/conf.d
3. 关于MySQL连接配置
宿主机，端口默认33060，host为localhost
容器之间有自己的网络。.env中, host填写docker内的网络IP，如172.24.0.2
端口3306。具体查看方法：
查看容器详情
`docker inspect compose-laravel_mysql_1`
找到 IPAddress
或者进入容器`docker exec -it compose-laravel_mysql_1 bash`，执行
 `/sbin/ip route|awk '/default/ { print $3 }'`

### 参考：
https://segmentfault.com/a/1190000013020851