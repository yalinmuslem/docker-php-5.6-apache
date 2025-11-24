FROM webdevops/php-apache:5.6
# Install Composer (dalam container PHP 5.6)
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# Set PHP configuration for max_file_uploads
RUN echo "max_file_uploads = 100" >> /usr/local/etc/php/php.ini