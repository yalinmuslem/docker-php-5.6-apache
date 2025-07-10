FROM webdevops/php-apache:5.6

COPY stats.so /usr/local/lib/php/extensions/no-debug-non-zts-20131226/
RUN echo "extension=stats.so" > /etc/php/5.6/apache2/conf.d/20-stats.ini