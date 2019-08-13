FROM php:7.2-apache

#apache rewrite
RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load
RUN rm -f /etc/apache2/sites-enabled/000-default.conf
COPY default.conf /etc/apache2/sites-enabled/
COPY php.ini /usr/local/etc/php
COPY init.sh /var/www/html/
RUN chmod 777 /var/www/html/init.sh

#安装不工具
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpq-dev \
        g++ \
        libicu-dev \
        libxml2-dev \
        uuid-dev \
        vim \
        git \
        supervisor\
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo pdo_mysql mysqli opcache \
    && a2enmod rewrite \
    && a2enmod ssl

#安装Redis 扩展
RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis

#安装uuid扩展
RUN pecl install uuid \
    && docker-php-ext-enable uuid

#supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/supervisord.conf

# Apache默认使用80端口
EXPOSE 6666
ENTRYPOINT ["/usr/bin/supervisord","-c", "/etc/supervisor/supervisord.conf"]
