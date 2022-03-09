FROM php:7.4.25-fpm

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

RUN docker-php-ext-configure pdo_mysql && docker-php-ext-install pdo_mysql
RUN apt-get update && apt-get install libgmp-dev -y && \
    apt-get update && apt-get install -y libgmp-dev re2c libmhash-dev libmcrypt-dev file && \
    docker-php-ext-configure gmp && docker-php-ext-install gmp

RUN apt-get -y update \
    && apt-get install -y libicu-dev \ 
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && apt-get update \
    && apt-get install -y libxml2-dev \
    && docker-php-ext-install soap \
    && docker-php-ext-install bcmath \
    && apt-get install -y libxslt1-dev \
    && docker-php-ext-install xsl \
    && apt-get install -y libzip-dev \
    && docker-php-ext-install zip \
    && docker-php-ext-install sockets

WORKDIR /var/www/html/project