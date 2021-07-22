FROM php:5.6-apache

# imagick
RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    libssl-dev \
    libmagickwand-dev && \
    rm -rf /var/lib/apt/lists/*

RUN pecl install imagick && docker-php-ext-enable imagick

RUN docker-php-ext-install mysqli

RUN pecl install mongodb-1.3.4 && docker-php-ext-enable mongodb

RUN docker-php-ext-install calendar

# RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl
# RUN docker-php-ext-install imap

RUN docker-php-ext-install mcrypt

RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ 
RUN docker-php-ext-install -j$(nproc) gd 

RUN docker-php-ext-install gettext

RUN docker-php-ext-install exif