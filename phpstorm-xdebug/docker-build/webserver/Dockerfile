FROM phpstorm/php-56-apache-xdebug-25

RUN mkdir /www
RUN mv /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.bak
RUN rm /etc/apache2/sites-enabled/000-default.conf
# ADD sites-available/symfony.conf /etc/apache2/sites-available/symfony.conf
ADD apache2.conf /etc/apache2/apache2.conf
ADD sites-available/symfony.conf /etc/apache2/sites-enabled/symfony.conf