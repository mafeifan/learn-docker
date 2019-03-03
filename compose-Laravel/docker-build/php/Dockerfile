FROM php:7.0.1-fpm
LABEL maintainer="mafeifan <mafeifan@qq.com>"

ADD apt-list /opt/

# use China sources to boost
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

# inspired by https://github.com/laradock/laradock/blob/master/php-fpm/Dockerfile
###########################################################################
# PHP MongoDB EXTENSION
###########################################################################

ARG INSTALL_MONGO=false

RUN if [ ${INSTALL_MONGO} = true ]; then \
    # Install PHP Mongodb extension
    if [ $(php -r "echo PHP_MAJOR_VERSION;") = "5" ]; then \
      pecl install mongo && \
      docker-php-ext-enable mongo \
    ;fi && \
    pecl install mongodb && \
    docker-php-ext-enable mongodb \
;fi


###########################################################################
# PHP REDIS EXTENSION
###########################################################################

ARG INSTALL_REDIS=false

RUN if [ ${INSTALL_REDIS} = true ]; then \
    # Install PHP Redis Extension
    printf "\n" | pecl install -o -f redis \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis \
;fi

# xdebug
#RUN pecl install xdebug-2.5.5
#RUN docker-php-ext-enable xdebug

RUN apt-get install -y libmcrypt-dev && \
    docker-php-ext-install mcrypt pdo_mysql mbstring zip

# add yac module
#COPY extension/yac.so /usr/local/lib/php/extensions/no-debug-non-zts-20151012
#COPY extension/yac.ini  /usr/local/etc/php/conf.d

#COPY php.ini  /usr/local/etc/php/

###########################################################################
# Composer:
###########################################################################
ARG INSTALL_COMPOSER=false
RUN if [ ${INSTALL_COMPOSER} = true ]; then \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    # set China source
    # when docker is running, run `docker exec compose-laravel_php_1 composer install -vvv`
    composer config -g repo.packagist composer https://packagist.laravel-china.org \
;fi

# set work dir
WORKDIR /www

