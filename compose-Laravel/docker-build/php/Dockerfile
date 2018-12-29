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
    docker-php-ext-install mcrypt pdo_mysql mbstring


# add yac module
#COPY extension/yac.so /usr/local/lib/php/extensions/no-debug-non-zts-20151012
#COPY extension/yac.ini  /usr/local/etc/php/conf.d
#COPY php.ini  /usr/local/etc/php/

WORKDIR /www
