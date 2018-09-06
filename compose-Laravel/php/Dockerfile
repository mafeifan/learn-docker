FROM php:7.0.31-fpm

ADD apt-list /opt/

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak \ 
	&& cat /opt/apt-list >/etc/apt/sources.list \ 
	&& apt-get update && \
    apt-get install -y libmcrypt-dev && \
    docker-php-ext-install mcrypt pdo_mysql