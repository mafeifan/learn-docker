### 安装
1. 保持docker-build和docker-compose文件和项目文件平级
2. 复制.env.example为.env并修改相关配置，比如您的PHP项目需要支持MongoDB，则将
PHP_INSTALL_MONGO修改为true。

### 运行

1. 检查 docker-compose 中的端口，避免与本地的冲突
2. 执行 `docker-compose up` 启动相关容器

### 注意

1. 如果修改了某一dockerfile文件后要重建镜像
`docker-compose up -d --build`

2. 关于PHP，默认是7.0.1，如果需要安装其他版本，修改php/Dockerfile中的第一行
FROM php:x.x.x-fpm

3. 关于MySQL连接配置
宿主机连接MySQL，host为localhost，端口默认33060。
项目代码中连接，host填写mysql(容器名，docker会自动转换)或docker中的IP，端口3306。

4. 如果是Laravel项目，执行php artisan。 使用 `docker-compose exec <php-container> php artisan`
https://github.com/laradock/laradock/issues/610

5. 不重启容器重启加载php.ini。 `docker exec -it <php-container> kill -USR2 1`
https://github.com/docker-library/php/issues/399

6. 如果需要备份mysql数据库，可以`docker exec -it compose-laravel_mysql_1  mysqldump -uroot -p123456 --databases ngb_inventory | gzip > demo.gz`
具体查 mysqldump 的命令参数

> IP具体查看方法：

查看容器详情
`docker inspect <mysql-container>`
找到 IPAddress
或者进入容器 `docker exec -it <mysql-container> bash`，执行
 `/sbin/ip route|awk '/default/ { print $3 }'`