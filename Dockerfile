FROM php:5.6-apache

RUN echo "deb http://archive.debian.org/debian stretch main contrib non-free" > /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    libssl-dev \
    libmagickwand-dev

RUN docker-php-ext-install mysqli

RUN docker-php-ext-install calendar

# # RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl
# # RUN docker-php-ext-install imap

RUN docker-php-ext-install mcrypt

RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ 
RUN docker-php-ext-install -j$(nproc) gd 

RUN docker-php-ext-install gettext

RUN docker-php-ext-install exif

RUN apt-get update && apt-get install -y zlib1g-dev \
    && docker-php-ext-install zip

# git clone https://github.com/mongodb/mongo-php-driver.git
# cd mongo-db-driver
# git submodule update --init
# phpize && ./configure
# make all
# make install
# git clone https://github.com/Imagick/imagick
# cd imagick
# phpize && ./configure
# make
# make install

# COPY Dockerfile /var/www/html
# COPY docker-compose.yml /var/www/html
# COPY mongodb-1.3.4.tgz /var/www/html
COPY imagick /var/www/html
COPY mongodb.so /usr/local/lib/php/extensions/no-debug-non-zts-20131226
COPY imagick.so /usr/local/lib/php/extensions/no-debug-non-zts-20131226

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

RUN echo "session.save_path=/tmp" >> /usr/local/etc/php/php.ini
RUN echo "date.timezone=Asia/Jakarta" >> /usr/local/etc/php/php.ini
RUN echo "memory_limit=512M" >> /usr/local/etc/php/php.ini
RUN echo "max_execution_time=300" >> /usr/local/etc/php/php.ini
RUN echo "extension=mongodb.so" >> /usr/local/etc/php/php.ini
RUN echo "extension=imagick.so" >> /usr/local/etc/php/php.ini