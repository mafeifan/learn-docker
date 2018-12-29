FROM php:7.0.1-fpm

ADD apt-list /opt/

# use 163 sources to boost
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak \ 
	&& cat /opt/apt-list >/etc/apt/sources.list \
	&& apt-get update

# support gd2 and iconv
# see https://hub.docker.com/_/php
RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN apt-get install -y libmcrypt-dev && \
    docker-php-ext-install mcrypt pdo_mysql mbstring zip

# add yac module
#COPY extension/yac.so /usr/local/lib/php/extensions/no-debug-non-zts-20151012
#COPY extension/yac.ini  /usr/local/etc/php/conf.d
#COPY php.ini  /usr/local/etc/php/

# 安装 composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# 设置中国源
# 在这个容器启动后可以执行 docker exec compose-laravel_php_1 composer install -vvv
RUN composer config -g repo.packagist composer https://packagist.laravel-china.org

# 设置工作目录，使得登录后直接切换到该目录
WORKDIR /www

