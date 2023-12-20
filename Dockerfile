FROM php:8-apache

RUN apt-get update && apt-get upgrade -y
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN a2enmod rewrite

# Composer install
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --quiet \
    && mv composer.phar /usr/local/bin/composer \
    && rm composer-setup.php

RUN apt -y update \
    && apt -y install git
