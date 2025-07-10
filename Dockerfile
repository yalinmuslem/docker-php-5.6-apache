FROM webdevops/php-apache:5.6
# Install Composer (dalam container PHP 5.6)
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer
